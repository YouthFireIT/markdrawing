<?php

namespace App\Http\Controllers\Frontend;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\AttributeSet;
use App\Attribute;
use App\Brand;
use App\Review;
use App\Cart;
use App\Shipping;
use App\City;
use App\OrderProduct;
use App\Product;
use App\ProductImage;
use App\Order;
use Auth;
use Session;
class CheckoutController extends Controller
{
    //
    public function index(){
       $product =  Session::get('product');
       $price =  Session::get('totalPrice');
    //    dd($price);
        return view('frontend.markdrawing.checkout');
    }

    /**
     * Checkout Store
     * return Checkout Response
     */
    public function store(Request $request){
        // dd(Auth::user()->id)
        // return $request;
        $carts = Session::get('product');
        if (Session::has('product')) {
            $cart_counts = count(array_keys($carts['id']));
            }else {
              $cart_counts = 0;
            }
        // dd($carts);
        if (Auth::check()) {
                $order = new Order();
                // if(!empty(Auth::user()->id())){
                    $order->user_id = Auth::user()->id;
                // }
                $order->phone = $request->phone;
                $order->email = $request->email;
                $order->name = $request->first_name;
                $order->city_name = $request->city;
                $order->shipping_address = $request->address;
                if(!empty(Session::get('totalPrice'))){
                $order->amount = Session::get('totalPrice');
                }
                $order->save();
                $order_id = $order->id;

                for($i = 0; $i < $cart_counts; $i++){
                    $order_product = new OrderProduct();
                    $order_product->orders_id = $order_id;
                    $order_product->products_id = $carts['id'][$i];
                    $order_product->person = $carts['person'][$i];
                    $order_product->products_quantity = $carts['quantity'][$i];
                    // $order_product->country = $carts['country'][$i];
                    $order_product->option_id = json_encode($carts['canvasOption'][$i]);
                    $order_product->print_id = json_encode($carts['canvasPrint'][$i]);
                    $order_product->notes = $carts['notes'][$i];
                    $order_product->image = $carts['image'][$i];
                    $order_product->products_price = $carts['price'][$i];
                    $order_product->save();
                }
         }else{
            $order = new Order();
            $order->phone = $request->phone;
            $order->email = $request->email;
            $order->name = $request->first_name;
            $order->city_name = $request->city;
            $order->shipping_address = $request->address;
            if(!empty(Session::get('totalPrice'))){
            $order->amount = Session::get('totalPrice');
            }
            $order->save();
            $order_id = $order->id;

            for($i = 0; $i < $cart_counts; $i++){
                $order_product = new OrderProduct();
                $order_product->orders_id = $order_id;
                $order_product->products_id = $carts['id'][$i];
                $order_product->person = $carts['person'][$i];
                $order_product->products_quantity = $carts['quantity'][$i];
                // $order_product->country = $carts['country'][$i];
                $order_product->option_id = json_encode($carts['canvasOption'][$i]);
                $order_product->print_id = json_encode($carts['canvasPrint'][$i]);
                $order_product->note = $carts['notes'][$i];
                $order_product->image = $carts['image'][$i];
                $order_product->products_price = $carts['price'][$i];
                $order_product->save();
            }
        }
        Session::forget('product');
        Session::forget('totalPrice');
        Session::forget('cartCount');
        return view('frontend.markdrawing.thanks');
    }
    public function paymentSuccess(){
        return 'dsgha';
    }

}
