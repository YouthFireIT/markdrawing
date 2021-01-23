<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\User;
use App\Order;
use Auth;
class UserprofileController extends Controller
{
    public function show()
    {	
    	return view('frontend.pages.user.home');
    }


    /**
     * return response 
     * 
     */

     public function index(){
        $orders = Order::orderBy('id','desc')->where('user_id',Auth::user()->id)->paginate(20);
         return view('frontend.markdrawing.user.index',compact('orders'));
     }

     
}
