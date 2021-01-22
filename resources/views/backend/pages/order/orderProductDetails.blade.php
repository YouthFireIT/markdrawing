@php
  use App\OrderProduct;
  use App\Product;
  use App\ProductImage;
  use App\Attribute;
  use App\Brand;
@endphp

@extends('backend.layouts.master')

@section('content')

<div class="row">

<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    
    <div class="card">
        <h5 class="card-header">Manage Product Wise Orders</h5>
        <div class="card-body">
            @include('backend.layouts.error')

            <div class="table-responsive">
            <table class="table table-hover tablie-striped">

                <tr>
                  <th>#</th>
                  <th>Product Image</th>
                  <th>Target Image</th>
                  <th>Product Title</th>
                  <th>Message</th>
                  <th>Person</th>
                  <th>Canvas Option</th>
                  <th>Canvas Print</th>
                  <th>Quantity</th>
                  <th>Amount</th>
                  <th>Status</th>                    
                </tr>

                @foreach($orderProducts as $orderProduct)                
                <tr>
                  <td>{{ $loop->index+1 }}</td>
                  @php 
                    $product = Product::find($orderProduct->products_id);
                    $image = ProductImage::where('product_id', $orderProduct->products_id)->first();
                  @endphp
                  <td><img src="{{asset('images/'.$image->image)}}" width="50px;"></td>
                  <td><img src="{{asset('cartImages/'.$orderProduct->image)}}" width="50px;"></td>
                  <td>{{ $product->title }}</td>
                  <td>{{$orderProduct->note}}</td>
                  <td>{{$orderProduct->person}}</td>
                  @if(!empty($orderProduct->option_id))
                  <td>
                    @php   
                      $options = $orderProduct->option_id;
                      $dcodeOption = json_decode($options);
                      for($i = 0; $i < count($dcodeOption); $i++){
                        $option = Attribute::find($dcodeOption[$i]);
                        if($i < count($dcodeOption)-1){
                          echo $option->name.",";
                        } else {
                          echo $option->name;
                        }  
                      }
                    @endphp
                  </td>
                  @else 
                    <td>NULL</td>
                  @endif

                  @if(!empty($orderProduct->print_id))
                  <td>
                    @php   
                      $prints = $orderProduct->print_id;
                      $dcodePrint = json_decode($prints);
                      for($j = 0; $j < count($dcodePrint); $j++){
                        $print = Brand::find($dcodePrint[$j]);
                        if($j < count($dcodePrint)-1){
                          echo $print->name.",";
                        } else {
                          echo $print->name;
                        }  
                      }
                    @endphp
                  </td>
                  @else 
                    <td>NULL</td>
                  @endif

                  <td>{{$orderProduct->products_quantity}}</td>
                  <td>{{$orderProduct->products_price}}</td> 
                  <td>                      
                    <div class="form-check form-check-inline">
                      @if($orderProduct->is_image_comp == 1)
                        <input class="form-check-input" type="checkbox" checked="checked" onclick="check_image_complete(`{{ $orderProduct->id }}`)">
                      @else
                        <input class="form-check-input" type="checkbox" onclick="check_image_complete(`{{ $orderProduct->id }}`)">
                      @endif
                        <label class="form-check-label" for="{{$orderProduct->id}}">Image Complete</label>
                    </div>

                    @if(!empty($orderProduct->option_id))
                      <div class="form-check form-check-inline">
                        @if($orderProduct->is_option_comp == 1)
                          <input class="form-check-input" type="checkbox" checked="checked" onclick="check_option_complete(`{{ $orderProduct->id }}`)">
                        @else
                          <input class="form-check-input" type="checkbox" onclick="check_option_complete(`{{ $orderProduct->id }}`)">
                        @endif
                          <label class="form-check-label" for="{{$orderProduct->id}}">Option Complete</label>
                      </div>
                    @endif

                    @if(!empty($orderProduct->print_id))
                      <div class="form-check form-check-inline">
                        @if($orderProduct->is_print_comp == 1)
                          <input class="form-check-input" type="checkbox" checked="checked" onclick="check_print_complete(`{{ $orderProduct->id }}`)">
                        @else
                          <input class="form-check-input" type="checkbox" onclick="check_print_complete(`{{ $orderProduct->id }}`)">
                        @endif
                          <label class="form-check-label" for="{{$orderProduct->id}}">Print Complete</label>
                      </div>
                    @endif

                  </td>  
                </tr>      
                @endforeach

            </table>
            </div>                 
        </div>

    </div>
</div>

<script>
  function check_image_complete(orderProductId){
    $.ajaxSetup({
        headers: {
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
      });
      $.ajax({
        type: "post",
        url : '{{url("admin/orders/image-status-change")}}',
        data: {
          orderProductId: orderProductId
          },
        success:function(data) {
        }
    });
  }

  function check_option_complete(orderProductId){
    $.ajaxSetup({
        headers: {
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
      });
      $.ajax({
        type: "post",
        url : '{{url("admin/orders/option-status-change")}}',
        data: {
          orderProductId: orderProductId
          },
        success:function(data) {
        }
    });
  }

  function check_print_complete(orderProductId){
    $.ajaxSetup({
        headers: {
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
      });
      $.ajax({
        type: "post",
        url : '{{url("admin/orders/print-status-change")}}',
        data: {
          orderProductId: orderProductId
          },
        success:function(data) {
        }
    });
  }
</script>

@endsection