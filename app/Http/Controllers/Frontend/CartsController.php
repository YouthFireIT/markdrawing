<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Cart;
use App\Order;
use App\Product;
use App\Shipping;
use Auth;
use Session;
use App\TmpOrder;
use App\Offer;
 

class CartsController extends Controller
{
	public function index()
	{
	   // dd(Session::get('product'));
		return view('frontend.pages.product.cart');
	}


    public function store(Request $request)
    {
        // dd($request->quantity);
    	$request->validate([
    		'product_id' => 'required',   		
    	]);
    	
    // 	$product = Product::find($request->product_id);
    	
    	

    	if (Auth::check()) {
    		
            $request->session()->push('product.id', $request->product_id);
            $request->session()->push('product.originalQty', $request->quantity);
            $request->session()->push('product.quantity', $request->qtybutton);
            $request->session()->push('product.user_id', Auth::user()->id);
            $product = Product::find($request->product_id);
            // var_dump($product->price); exit();
            if (!is_null($product)) {
                if ($product->is_add_to_offer == 1) {
                    // dd($product->offer_price);
                    $offer = Offer::find($product->offer_id);
                    $rate = $offer->rate;
                    $subStringedRate = substr($rate, 0, strpos($rate, "%"));
                    $disPrice = ($product->price*$request->qtybutton*$subStringedRate)/100;
                    $price = $product->price - $disPrice;
                    
                    // $request->session()->push('product.offer', $subStringedRate);
                    $request->session()->push('product.disPrice', $disPrice);
                    $request->session()->push('product.price', $price);
                    $request->session()->push('product.mainprice', $product->offer_price);
                }else {
                    // dd($product->price);
                     $price = $product->price*$request->qtybutton;
                     $request->session()->push('product.disPrice', "0");
                     $request->session()->push('product.price', $price);
                     $request->session()->push('product.mainprice', $product->price);
                }
                
            }else {
                session()->flash('success',"We couldn't find this product.");
                return back();
            }

            if ($request->attribute_options) {
                $attribute_options = serialize($request->attribute_options);
                $request->session()->push('product.attribute_options', $attribute_options);
            }
			

    	}
    	else{

            $request->session()->push('product.id', $request->product_id);
            $request->session()->push('product.originalQty', $request->quantity);
            $request->session()->push('product.quantity', $request->qtybutton);
            $product = Product::find($request->product_id);
            // var_dump($product->price); exit();
            if (!is_null($product)) {
                if ($product->is_add_to_offer == 1) {
                    $offer = Offer::find($product->offer_id);
                    $rate = $offer->rate;
                    $subStringedRate = substr($rate, 0, strpos($rate, "%"));
                    $disPrice = ($product->price*$request->qtybutton*$subStringedRate)/100;
                    $price = $product->price - $disPrice;
                    
                    // $request->session()->push('product.offer', $subStringedRate);
                    $request->session()->push('product.disPrice', $disPrice);
                    $request->session()->push('product.price', $price);
                    $request->session()->push('product.mainprice', $product->offer_price);
                }else {
                     $price = $product->price*$request->qtybutton;
                     $request->session()->push('product.disPrice', "0");
                     $request->session()->push('product.price', $price);
                     $request->session()->push('product.mainprice', $product->price);
                }
                
            }else {
                session()->flash('success',"We couldn't find this product.");
                return back();
            }

            if ($request->attribute_options) {
                $attribute_options = serialize($request->attribute_options);
                $request->session()->push('product.attribute_options', $attribute_options);
            }else {
                $request->session()->push('product.attribute_options', Null);
            }
			
		 
    	}


        return back();


    }


    public function ajaxstore(Request $request)
    {
        $product = Product::find($request->product_id);
        

    	if (Auth::check()) {
    		
            $request->session()->push('product.id', $request->product_id);
            $request->session()->push('product.originalQty', $request->quantity);
            $request->session()->push('product.quantity', $request->qtybutton);
            $request->session()->push('product.user_id', Auth::user()->id);
            
            
            if ($product->is_add_to_offer == 1) {
                $offer = Offer::find($product->offer_id);
                $rate = $offer->rate;
                $subStringedRate = substr($rate, 0, strpos($rate, "%"));
                $getPrice = $request->price/$request->qtybutton;
                $disPrice = ($getPrice*$subStringedRate)/100;
                $price = $request->price - ($disPrice*$request->qtybutton);
                // $disPrice = ($request->price*$subStringedRate)/100;
                // $price = $request->price - $disPrice;
                // $request->session()->push('product.offer', $subStringedRate);
                // $request->session()->push('product.disPrice', $disPrice);
                $request->session()->push('product.disPrice', $disPrice);
                $request->session()->push('product.price', $price);
            } else {
                $request->session()->push('product.disPrice', "0");
                $request->session()->push('product.price', $request->price);
            }
            
            
            
            $request->session()->push('product.mainprice', $request->prc);
            

    	}
    	else{

            $request->session()->push('product.id', $request->product_id);
            $request->session()->push('product.originalQty', $request->quantity);
            $request->session()->push('product.quantity', $request->qtybutton);
            
            if ($product->is_add_to_offer == 1) {
                $offer = Offer::find($product->offer_id);
                $rate = $offer->rate;
                $subStringedRate = substr($rate, 0, strpos($rate, "%"));
                
                $getPrice = $request->price/$request->qtybutton;
                $disPrice = ($getPrice*$subStringedRate)/100;
                $price = $request->price - ($disPrice*$request->qtybutton);
                
                // $request->session()->push('product.offer', $subStringedRate);
                $request->session()->push('product.disPrice', $disPrice);
                $request->session()->push('product.price', $price);
            } else {
                $request->session()->push('product.disPrice', "0");
                $request->session()->push('product.price', $request->price);
            }
            
            $request->session()->push('product.mainprice', $request->prc);			
		 
    	}


       return $success = Session::get('product');


    }

    public function updatequantity(Request $request, $id, $action,$dd)
    {
        $carts = Session::get('product');
       
        if($carts['quantity'][$id] < $carts['originalQty'][$id]){
            if ($action == "plus") {
           
                $quantity = $carts['quantity'][$id]+1;
    
                $carts['quantity'][$id] = $quantity;
                
                // if(!empty($carts['disPrice'][$id])){
                    $tmpPrice = $carts['mainprice'][$id] - $carts['disPrice'][$id];
                    $carts['price'][$id] = $carts['price'][$id] + $tmpPrice;
                // }
                
                    // $carts['price'][$id] = $carts['price'][$id] + $carts['price'][$id];
                    // $carts['price'][$id] = $carts['price'][$id] + $carts['mainprice'][$id];

    
                Session::put('product', $carts);
    
                return back();
    		
        	}
        }
    	
    	
    	if ($carts['price'][$id] != 0 && $carts['quantity'][$id] > 1) {
	    	if ($action == "minus") {
                


                $quantity = $carts['quantity'][$id]-1;

                $carts['quantity'][$id] = $quantity;
                
                $tmpPrice = $carts['mainprice'][$id] - $carts['disPrice'][$id];
                $carts['price'][$id] = $carts['price'][$id] - $tmpPrice;

                // $carts['price'][$id] = $carts['price'][$id] - $carts['mainprice'][$id];
                

                Session::put('product', $carts);

                return back();
	    		
	    	}

	    	
	    	
    	}
    	else {
    		return back();
    	}
    	
    	
    }


    public function addShipping($city)
    {
        $shipping = Shipping::find(1);

        if ($city == "Dhaka") {
                if (Session::has('shipping')) {
                    Session::put('shipping', $shipping->inside_dhaka);
                }
                else {
                    Session::put('shipping', $shipping->inside_dhaka);
                }

                Session::put('city', $city);

            }else {
                if (Session::has('shipping')) {
                    Session::put('shipping', $shipping->outside_dhaka);
                }
                else {
                    Session::put('shipping', $shipping->outside_dhaka);
                }

                $city = urldecode($city);
                Session::put('city', $city);
            }            

            return back();
        
    }


    public function temp_order_store()
    {
        $carts = Session::get('product');

        $total_product = count(array_keys($carts['id']));

        $tempStoreId = uniqid();
        Session::put('temp_store_id', $tempStoreId);

        for ($i = 0; $i<$total_product; $i++) {
            $product = Product::find($carts['id'][$i]);                

            $order = new TmpOrder;
            // dd($order);
            
            $order->product_id = $carts['id'][$i];
            
            $order->product_quantity = $carts['quantity'][$i];
            $order->product_title = $product->title;
            $order->product_price = $carts['price'][$i];

            $order->shipping_cost = Session::get('shipping');
            $order->city_name = Session::get('city');
            $order->tmp_uniq_id = $tempStoreId;

            $order->save();
        }

        return response()->json($tempStoreId);
    }


    public function delete(Request $request, $id)
    {
        
        
        $carts = Session::get('product');
        
        unset($carts['id'][$id]);
        unset($carts['originalQty'][$id]);
        unset($carts['quantity'][$id]);
        unset($carts['disPrice'][$id]);
        unset($carts['price'][$id]); 
        // if($carts['offer'][$id]){
        //     unset($carts['offer'][$id]);
        //     unset($carts['disPrice'][$id]);
        // }
        
        unset($carts['mainprice'][$id]);
        unset($carts['attribute_options'][$id]);
        Session::put('product', $carts);
        $update = Session::get('product');
        // dd(count($update['id']));
        // dd($update['id'][0]);
        Session::forget('product');
        
        // dd($carts);
        
        $tmp = count($update['id']);
        // dd($tmp);
        
        for($i=0; $i<=$tmp; $i++){
            if($i != $id){
            // dd($update['id'][$i+2]);
                $request->session()->push('product.id', $update['id'][$i]);
                $request->session()->push('product.originalQty', $update['originalQty'][$i]);
                $request->session()->push('product.quantity', $update['quantity'][$i]);
                // if($update['offer'][$i]){
                //     $request->session()->push('product.offer', $update['offer'][$i]);
                //     $request->session()->push('product.disPrice', $update['disPrice'][$i]);
                // } 
                $request->session()->push('product.disPrice', $update['disPrice'][$i]);
                $request->session()->push('product.price', $update['price'][$i]);
                
                // $product = Product::find($request->product_id);
                $request->session()->push('product.mainprice', $update['mainprice'][$i]);
                
                // $tmp--;
            }
            
            
        }
        
        // dd(Session::get('product'));
        
        
        // $newCarts = array();
        // foreach($update as $up){
            
        //     array_push($newCarts, $up);
        // }
        // dd($newCarts);
        // dd($carts['price'][$id]);
        // unset($carts['id'][$id]);
        
        // $update = Session::get('product');
        // dd($update['id'][$id]);
        // unset($carts->item[$id]);
        // if(($key = array_search($id, $carts)) !== false) {
        //     unset($carts[$key]);
        // }
        
        // $_SESSION["cart"] = array_values($items);
        
        
            // $carts = Session::get('product');
            // // unset($carts[$id]);
            //     unset($carts['id'][$id]);
            //     unset($carts['quantity'][$id]);
            //     unset($carts['price'][$id]);
            //     unset($carts['attribute_options'][$id]);
            //     Session::put('product', $carts);
                
            //     if($id == 0){
            //         Session::forget('product');
            //     }
            
        return back();        
    }



}
