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
use App\CartImage;
use App\Attribute;
use App\Brand;
use App\City;
 

class CartsController extends Controller
{
	public function index()
	{
		return view('frontend.markdrawing.cart');
	}

    public function store(Request $request)
    {   
        // dd($request->canvasOption);      
    	$request->validate([
    		'product_id' => 'required',   		
    	]);
    	
    // 	image save ////
        $image = $request->file('file');
        $date = date('Ymd_His');
        $imageName = $date.'_'.$image->getClientOriginalName();
        $imagePath = public_path('cartImages/');
        $image->move($imagePath.$imageName);
        $img = new CartImage;
        $img->name = $imageName;
        $img->save();

        // if(!empty($request->canvasOption)){
        //     $canvasOption = Attribute::find($request->canvasOption);
        //     $canvasOptionAmount = $canvasOption->amount;
        //     $canvasOptionName = $canvasOption->name;
        // } else {
        //     $canvasOptionAmount = 0;
        //     $canvasOptionName = 0;
        // }

        // if(!empty($request->canvasPrint)){
        //     $canvasPrint = Brand::find($request->canvasPrint);
        //     $canvasPrintAmount = $canvasPrint->amount;
        //     $canvasPrintName = $canvasPrint->name;
        // } else {
        //     $canvasPrintAmount = 0;
        //     $canvasPrintName = 0;
        // }

        if(!empty($request->country)){
            $country = City::find($request->country);
            $countryName = $country->name;
        } else {
            $countryName = 0;
        }

        // $product = Product::find($request->product_id);
        // $price = ($product->price*$request->person) + $canvasOptionAmount + $canvasPrintAmount;
        // $productPrice = $product->price + $canvasOptionAmount + $canvasPrintAmount;	

    	if (Auth::check()) {    		
            $request->session()->push('product.id', $request->product_id);
            $request->session()->push('product.person', $request->person);
            $request->session()->push('product.quantity', 1);
            $request->session()->push('product.country', $countryName);
            
            if(!empty($request->canvasOption)){
                $request->session()->push('product.canvasOption', $request->canvasOption);
            } else {
                $request->session()->push('product.canvasOption', "0");
            }

            if(!empty($request->canvasPrint)){
                $request->session()->push('product.canvasPrint', $request->canvasPrint);
            } else {
                $request->session()->push('product.canvasPrint', "0");
            }
                        
            $request->session()->push('product.notes', $request->notes);
            $request->session()->push('product.image', $imageName);
            $request->session()->push('product.user_id', Auth::user()->id);            
            // $request->session()->push('product.price', $price);
            // $request->session()->push('product.productPrice', $productPrice);
    	} else{
            $request->session()->push('product.id', $request->product_id);
            $request->session()->push('product.person', $request->person);
            $request->session()->push('product.quantity', 1);
            $request->session()->push('product.country', $countryName);
            $request->session()->push('product.canvasOption', $request->canvasOption);
            $request->session()->push('product.canvasPrint', $request->canvasPrint);
            $request->session()->push('product.notes', $request->notes);
            $request->session()->push('product.image', $imageName);
            // $request->session()->push('product.price', $price);
            // $request->session()->push('product.productPrice', $productPrice);
        }
        
        $count = 1;
        if(Session::has('cartCount')){
            $count = Session::get('cartCount') + 1;
        }
        Session::put('cartCount', $count);
        return redirect()->route('index')->with('message', 'Product is added to cart successfully');
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
        unset($carts['person'][$id]);
        unset($carts['quantity'][$id]);
        unset($carts['country'][$id]);
        unset($carts['canvasOption'][$id]);
        unset($carts['canvasPrint'][$id]); 
        unset($carts['notes'][$id]);
        unset($carts['image'][$id]);

        Session::put('product', $carts);
        $update = Session::get('product');
        Session::forget('product');

        for($i=0; $i<=count($update['id']); $i++){
            if($i != $id){
                $request->session()->push('product.id', $update['id'][$i]);
                $request->session()->push('product.person', $update['person'][$i]);
                $request->session()->push('product.quantity', $update['quantity'][$i]);
                $request->session()->push('product.country', $update['country'][$i]);
                $request->session()->push('product.canvasOption', $update['canvasOption'][$i]);
                $request->session()->push('product.canvasPrint', $update['canvasPrint'][$i]);
                $request->session()->push('product.notes', $update['notes'][$i]);
                $request->session()->push('product.image', $update['image'][$i]);
            }            
        }
        $cartCount = Session::get('cartCount');
        Session::put('cartCount', $cartCount-1);           
        return back();        
    }

    public function increase_quantity(Request $request)
    {   
        // dd($request->totalPrice);
        $carts = Session::get('product');           
        $quantity = $carts['quantity'][$request->cartId]+1;    
        $carts['quantity'][$request->cartId] = $quantity;
        Session::put('product', $carts);

        Session::put('totalPrice', $request->totalPrice);
        return true;
    		
    }

    public function decrease_quantity(Request $request)
    {
        $carts = Session::get('product');           
        $quantity = $carts['quantity'][$request->cartId]-1;    
        $carts['quantity'][$request->cartId] = $quantity;
        Session::put('product', $carts);
        Session::put('totalPrice', $request->totalPrice);
        return true;
    		
    }

}
