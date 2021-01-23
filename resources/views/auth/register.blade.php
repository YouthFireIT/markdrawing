@extends('frontend.layouts.master.app')

@section('content')
<div class="wrapper-register py-5">
    <div class="container">
        <div class="col-lg-6 m-auto">
            <h1 class="text-center pp-registerheading">Create Account</h1>
            <div class="form-error-mess" id="form-error-div">
                <h2>Please adjust the following:</h2>
                <ul>
                    <li><span class="error-message" id="error-message1"></span></li>
                    <li id="li-mgs2"><span class="error-message" id="error-message2"></span></li>
                    <li id="li-mgs3"><span class="error-message" id="error-message3"></span></li>
                    <li id="li-mgs4"><span class="error-message" id="error-message4"></span></li>
                </ul>
            </div>
            <form class="pp-form" action="{{ route('register') }}" method="POST">
                @csrf
                <label class="pp-label" for="">{{ __('First Name*') }}</label>
                {{-- <input type="text" id="pp-firstname" class="pp-inputbox"> --}}
                <input id="pp-firstname" type="text" class="pp-inputbox @error('first_name') is-invalid @enderror" name="first_name" value="{{ old('first_name') }}" required autocomplete="first_name" autofocus>
                @error('first_name')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror

                <label class="pp-label" for="">{{ __('Last Name*') }}</label>
                {{-- <input type="text" id="pp-lastname" class="pp-inputbox"> --}}
                <input id="pp-lastname" type="text" class="pp-inputbox @error('last_name') is-invalid @enderror" name="last_name" value="{{ old('last_name') }}" required autocomplete="last_name">
                @error('last_name')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror

                <label class="pp-label" for="">{{ __('Email*') }}</label>
                {{-- <input type="text" id="pp-email" class="pp-inputbox"> --}}
                <input id="pp-email" type="text" class="pp-inputbox @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" autocomplete="email">
                @error('email')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror

                <label class="pp-label" for="">{{ __('Password*') }}</label>
                {{-- <input type="password" id="pp-password" class="pp-inputbox"> --}}
                <input id="pp-password" type="password" class="pp-inputbox @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">
                @error('password')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror

                <label class="pp-label" for="">{{ __('Password Confirmation*') }}</label>
                {{-- <input type="password" id="pp-password" class="pp-inputbox"> --}}
                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">

                <div class="text-center">
                    <input class="submit mt-4" type="submit" value="CREATE">
                </div>

            </form>
        </div>
    </div>
</div> 
@endsection