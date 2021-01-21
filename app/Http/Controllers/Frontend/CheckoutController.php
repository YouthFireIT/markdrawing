<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Session;

class CheckoutController extends Controller
{
    //
    public function index(){
        dd(Session::get('product'));
        return view('frontend.markdrawing.checkout');
    }
}
