@extends('frontend.layouts.master.app')
@section('style')
<style>
    .owl_button{
        display: none;
    }
    .item{background: #fff;border-radius: 10px; padding:30px;box-shadow: 0 0 10px #00000050;transform: scale(.9)}
    .item img{width: 120px;height:120px;border-radius: 50%;object-fit: cover;border: 8px ridge #fff;box-shadow: 0 0 10px #00000050}
</style>
@endsection

@section('content')
  <section>
    <br/><br/><center><font size="13pt"><b>Thank You. Your order  is placed successfully</b></font></center>   
	</section>
@endsection