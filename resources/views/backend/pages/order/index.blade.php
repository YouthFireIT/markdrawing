@php
use App\OrderProduct;
use App\Product;
@endphp

@extends('backend.layouts.master')
@section('content')
    <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="card">
                <h5 class="card-header">Manage Orders</h5>
                <div class="card-body">
                    @include('backend.layouts.error')
                    <div class="table-responsive">
                        <table class="table table-hover tablie-striped">
                            <tr>
                                <th>#</th>
                                <th>Customer Name</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Delivery Address</th>
                                <th>Payment Status</th>
                                <th>Products</th>
                            </tr>

                            @foreach ($orders as $order)
                                <tr>
                                    <td>{{ $loop->index + 1 }}</td>
                                    <td>{{ $order->name }}</td>
                                    <td>{{ $order->phone }}</td>
                                    <td>{{ $order->email }}</td>
                                    <td>City: {{ $order->city_name }} Shipping Address: {{ $order->shipping_address }}</td>
                                    @if ($order->status == 0)
                                        <td  id="order{{ $order->id }}" onclick="change_status(`{{ $order->id }}`)">Pending
                                        </td>
                                    @else
                                        <td  id="order{{ $order->id }}" onclick="change_status(`{{ $order->id }}`)">Fullfill</td>
                                    @endif
                                    <td>
                                        <a href="{{ route('order.product.details', $order->id) }}"
                                            class="btn btn-sm btn-primary">Details</a>
                                    </td>
                                </tr>
                            @endforeach

                        </table>
                    </div>
                    {{ $orders->links() }}
                </div>
            </div>
        </div>

        <script>
            function change_status(orderId) {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    type: "post",
                    url: "{{ url('admin/orders/status-change') }}",
                    data: {
                        orderId: orderId
                    },
                    success: function(data) {
                        if (parseInt(data) == 1) {
                            document.getElementById("order" + orderId).textContent = "Fullfill";
                        } else {
                            document.getElementById("order" + orderId).textContent = "Pending";
                        }
                        console.log(data);
                    }
                });
            }

        </script>

    @endsection
