@extends('backend.layouts.master')

@section('content')

<div class="row">

<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    
    <div class="card">
        <h5 class="card-header">Add New Print Option</h5>
        <div class="card-body">
            @include('backend.layouts.error')
            <form action="{{ route('admin.brand.store') }}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <div class="row">
                        <div class="col">
                        <label for="name" class="col-form-label">Name</label>
                        <input id="name" type="text" class="form-control" name="name" required="">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col">
                        <label for="amount" class="col-form-label">Amount</label>
                        <input id="amount" type="text" class="form-control" name="amount" required="">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>

                
            </form>
        </div>

    </div>
</div>

@endsection