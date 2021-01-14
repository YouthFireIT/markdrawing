<?php

namespace App\Http\Controllers\Backend;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;

use Illuminate\Http\Request;
use App\Product;
use App\Offer;

class OfferController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    
    public function create()
    {
    	//$products = Product::orderBy('id', 'desc')->paginate(20);
    	return view('backend.pages.offer.create');
    }


    public function createnext()
    {
        $products = Product::orderBy('id', 'desc')->paginate(20);
        //get last order
        $offer = Offer::orderBy('id', 'desc')->first();
        return view('backend.pages.offer.addproducts', compact('products', 'offer') );


    }



    public function store(Request $request)
    {
    	$offer = new Offer;
    	$offer->name = $request->name;
    	$offer->start = $request->start;
    	$offer->end = $request->end;
    	$offer->continue = $request->continue;
    	$offer->rate = $request->rate."%";

        $new_slug= Str::slug($request->name,'-');

        $checkifsameslughas = Offer::orWhere('slug','like','%'.$new_slug.'%')->get();
        if (count($checkifsameslughas) > 0) {
            $slug_last_value = count($checkifsameslughas)+1;
            $final_slug = $new_slug."-".$slug_last_value;
            $offer->slug = $final_slug;
        }
        else {
            $offer->slug = $new_slug;
        }

    	$offer->save();
        return redirect()->route('admin.offer.createnext');

    }

    public function addproducts($product_id, $offer_id)
    {
        
        
        $current_time = date("Y-m-d");
        $current = date_parse_from_format('Y-m-d', $current_time);
        $current_timestamp = mktime(0, 0, 0, $current['month'], $current['day'], $current['year']);
        
        
        
        
        $offer = Offer::find($offer_id);
        
        $start_date = date_parse_from_format('Y-m-d', $offer->start);
        // dd($start_date);
        // $start_date = $offer->start;
        // dd($start_date);
        $start_timestamp = mktime(0, 0, 0, $start_date['month'], $start_date['day'], $start_date['year']);
        
        
        $end_date = date_parse_from_format('Y-m-d', $offer->end);
        // $end_date = $offer->end;
        $end_timestamp = mktime(0, 0, 0, $end_date['month'], $end_date['day'], $end_date['year']);
        // dd($end_timestamp);
        
        if($current_timestamp >= $start_timestamp && $current_timestamp <= $end_timestamp){
            $product = Product::find($product_id);
            if($product->is_add_to_offer == 0){
                $product->is_add_to_offer = 1;
                $product->offer_id = $offer_id;
                $product->save();
            } else{
                echo '<script>alert("Product Already Added In A Offer")</script>'; 
            }
        } else{
            echo '<script>alert("Offer no longer available")</script>';
        }
        
        // dd($product_id);
        
        
        
        

        if (is_null($offer->product_id)) {
            $offer->product_id = $product_id;
        }
        else {
            $array = explode(',',$offer->product_id);

            if (in_array($product_id,$array)) {

                unset($array[array_search($product_id,$array)]);

                $new_product_ids = implode(',', $array);

                $offer->product_id = $new_product_ids;

                echo $new_product_ids;
                $offer->save();
                return back();

            }
            else {
                $products_all = $offer->product_id.','.$product_id;
                $offer->product_id = $products_all;
                echo $products_all;
            }
            
        }



        $offer->save();
        
        return back();
    }


    public function manage()
    {
        $offers = Offer::orderBy('id', 'desc')->get();
        
        foreach($offers as $offer){
            
            $current_time = date("Y-m-d");
            $current = date_parse_from_format('Y-m-d', $current_time);
            $current_timestamp = mktime(0, 0, 0, $current['month'], $current['day'], $current['year']);
            
            $start_date = date_parse_from_format('Y-m-d', $offer->start);
            $start_timestamp = mktime(0, 0, 0, $start_date['month'], $start_date['day'], $start_date['year']);
            
            $end_date = date_parse_from_format('Y-m-d', $offer->end);
            $end_timestamp = mktime(0, 0, 0, $end_date['month'], $end_date['day'], $end_date['year']);
            
            if($current_timestamp >= $start_timestamp && $current_timestamp <= $end_timestamp){
                
                
            } else {
                // dd("hlw");
                $offer->product_id = "";
                $offer->save();
                $products = Product::where('offer_id', $offer->id)->get();
                foreach($products as $product){
                    $product->is_add_to_offer = 0;
                    $product->offer_id = "";
                    $product->save();
                }
            }
            
        }

        return view('backend.pages.offer.index', compact('offers') ); 
    }

    //Add products from index page
    public function addmoreproducts($id)
    {
        $products = Product::orderBy('id', 'desc')->paginate(20);
        //get last order
        $offer = Offer::find($id);
        return view('backend.pages.offer.addproducts', compact('products', 'offer') );


    }

    public function edit($id)
    {
        $offer = Offer::find($id);
        return view('backend.pages.offer.edit', compact('offer') );
    }

    public function update(Request $request, $id)
    {
        $offer = Offer::find($id);
        $offer->name = $request->name;
        $offer->start = $request->start;
        $offer->end = $request->end;
        if ($request->continue == 1) {
            $offer->continue = $request->continue;
        }
        else {
            $offer->continue = Null;
        }
        
        $offer->rate = $request->rate."%";
        
        $offer->save();

        return redirect()->route('admin.offers');

    }
}
