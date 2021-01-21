<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Session;
class CheckoutController extends Controller
{
    //
    public function index(){
       $product =  Session::get('product');
       $price =  Session::get('totalPrice');
       dd($price);
        return view('frontend.markdrawing.checkout');
    }
}
