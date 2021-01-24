@extends('frontend.layouts.master.app')

@section('content') 
   <div class="container py-5"> 
    <div class="row"> 
        <div class="col-lg-12">
            <h3>-----Order History-----</h3>
            <div class="table-responsive">
                <table class="table table-hover tablie-striped" id="order">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Customer Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Delivery Address</th>
                            <th>Payment Status</th> 
                            <th>Product Details</th> 
                        </tr>
                    </thead>

                    <tbody>
                        @foreach ($orders as $order)
                            <tr>
                                <td>{{ $loop->index + 1 }}</td>
                                <td>{{ $order->name }}</td>
                                <td>{{ $order->phone }}</td>
                                <td>{{ $order->email }}</td>
                                <td>City: {{ $order->city_name }} Shipping Address: {{ $order->shipping_address }}</td>
                                @if ($order->status == 0)
                                    <td>Pending
                                    </td>
                                @else
                                    <td>Fullfill</td>
                                @endif
                                <td>
                                    <a class="btn btn-sm btn-primary" onclick="show_order_products(`{{ $order->id }}`)">Products</a>
                                </td>
                            
                            </tr>
                        @endforeach
                    </tbody>

                </table>
            </div>
            {{ $orders->links() }}
        </div> 
    </div>
   </div>

   <script>
       function show_order_products(orderId){
        $.ajaxSetup({
            headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            type: "post",
            url : '{{url("user/my-order-products")}}',
            data: {
                orderId: orderId
            },
            success:function(data) {
            console.log(data);
            $('#order').empty().html(data);
            }
        });
       }
   </script>
@endsection