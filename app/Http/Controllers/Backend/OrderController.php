<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Order;
use App\Cart;
use App\OrderProduct;


class OrderController extends Controller
{
    public function __construct()
    { 
        $this->middleware('auth:admin');
    }

    
    public function manage()
    {
        // $orders = Order::orderBy('id','desc')->groupBy('transaction_id')->paginate(20);
        $orders = Order::orderBy('id','desc')->paginate(20);
    	return view('backend.pages.order.index',compact('orders'));
    }

    ///// new addded ////
    public function get_order_products($orderId)
    {
        $orderProducts = OrderProduct::where('orders_id', $orderId)->get();
        return view('backend.pages.order.orderProductDetails', compact('orderProducts'));
    }

    public function order_status_change(Request $request)
    {
        $order = Order::find($request->orderId);
        if($order->status == 0){
            $order->status = 1;
        } else {
            $order->status = 0;
        }        
        $order->save();
        return $order->status;
    }

    public function image_status_change(Request $request)
    {
        $orderProduct = OrderProduct::find($request->orderProductId);
        if($orderProduct->is_image_comp == 0){
            $orderProduct->is_image_comp = 1;
        } else {
            $orderProduct->is_image_comp = 0;
        }        
        $orderProduct->save();
        return $orderProduct->is_image_comp;
    }

    public function option_status_change(Request $request)
    {
        $orderProduct = OrderProduct::find($request->orderProductId);
        if($orderProduct->is_option_comp == 0){
            $orderProduct->is_option_comp = 1;
        } else {
            $orderProduct->is_option_comp = 0;
        }        
        $orderProduct->save();
        return $orderProduct->is_option_comp;
    }

    public function print_status_change(Request $request)
    {
        $orderProduct = OrderProduct::find($request->orderProductId);
        if($orderProduct->is_print_comp == 0){
            $orderProduct->is_print_comp = 1;
        } else {
            $orderProduct->is_print_comp = 0;
        }        
        $orderProduct->save();
        return $orderProduct->is_print_comp;
    }
    
    //// end /////

    public function search(Request $request)
    {
        if (!is_null($request->status)) {
            $orders = Order::where('status', $request->status)->paginate(9);
        }
        else{
    	$orders = Order::orWhere('phone', $request->search)
    		->orWhere('tracking_id', $request->search)
	    	->orWhere('name', 'like','%'.$request->search.'%')
	    	->orderBy('id', 'desc')->paginate(9);
        }

	    if (is_null($orders)) {
	    	session()->flash('danger', 'No search result');
	    	return back();
	    }
	    return view('backend.pages.order.index', compact('orders'));
    }

    public function update_status($id, $action)
    {
    	$order = Order::find($id);
    	$order->delivery_status = $action;
    	$order->save();
    	return back();
    }

    public function update_courier(Request $request,$id)
    {
        $order = Order::find($id);
        if (!is_null($order)) {          
            $order->courier_info = $request->courier_info;
            $order->save();
            session()->flash("success","Order updated.");
            
        }

        else {
            session()->flash("danger","Order not found");
        }

        return back();
    }

    public function delete($id)
    {
    	$order = Order::find($id);
    	$carts = unserialize($order->carts_id);
    	foreach ($carts as $cart) {
    	 	$carts_find = Cart::find($cart);
            if (!is_null($carts_find)) {
                $carts_find->delete();
            }
    	 	
    	 } 

    	 $order->delete();

    	 session()->flash('success', 'Order deleted successfully');
    	 return back();
    }

    function areaSearch(Request $request) {
        $orders = Order::where('city_name', $request->search)->paginate(9);
        return view('backend.pages.order.index', compact('orders'));

    }
}
