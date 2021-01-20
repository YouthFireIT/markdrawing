@extends('backend.layouts.master')

@section('content')

<div class="row">

<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    
    <div class="card">
        <h5 class="card-header">Edit Canvas Option</h5>
        <div class="card-body">
            @include('backend.layouts.error')
            <form action="{{ route('admin.attribute.update', $attribute->id) }}" method="post">
                @csrf
                <div class="form-group">
                    <label for="name" class="col-form-label">Name</label>
                    <input id="name" type="text" class="form-control" name="name" value="{{ $attribute->name }}">
                </div>

                <div class="form-group">
                    <label for="amount" class="col-form-label">Amount</label>
                    <input id="amount" type="text" class="form-control" name="amount" value="{{ $attribute->amount }}">
                </div>

                <div class="form-group">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>

                
            </form>
        </div>

    </div>
</div>

@endsection