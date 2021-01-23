@extends('frontend.layouts.master.app')

@section('content') 
   <div class="container py-5"> 
    <div class="row"> 
        <div class="col-lg-12">
            <h3>-----Order History-----</h3>
            <div class="table-responsive">
                <table class="table table-hover tablie-striped">
                    <tr>
                        <th>#</th>
                        <th>Customer Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Delivery Address</th>
                        <th>Payment Status</th> 
                    </tr>

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
                           
                        </tr>
                    @endforeach

                </table>
            </div>
            {{ $orders->links() }}
        </div> 
    </div>
   </div>
@endsection