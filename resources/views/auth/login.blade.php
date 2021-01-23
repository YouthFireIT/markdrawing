@extends('frontend.layouts.master.app')

@section('content')
<div class="wrapper-login py-5">
    <div class="container">
        <div class="col-lg-6 m-auto">
            <h1 class="text-center pp-loginheading">Login</h1>
            <div class="form-error-mess" id="form-error-mess">
                <h2>Please adjust the following:</h2>
                <p>
                    <i class="fas fa-circle"></i>
                    <span id="error-message"></span>
                </p>
            </div>
            <form class="pp-form" action="" method="post">
                @csrf
                <label class="pp-label" for="">{{ __('Email') }}</label>
                {{-- <input type="text" id="pp-email" class="pp-inputbox"> --}}
                <input id="pp-email" type="text" class="pp-inputbox @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                <label class="pp-label" for="">{{ __('Password') }}</label>
                {{-- <input type="password" id="pp-password" class="pp-inputbox"> --}}
                <input id="pp-password" type="password" class="pp-inputbox @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                <div class="text-center">
                    <a class="pp-fgca" href="#">Forgot your password?</a>
                    <input class="submit" type="submit" value="SIGN IN">
                    <a class="pp-fgca pp-fgcaa" href="{{ route('register') }}">Create account</a>
                </div>
            </form>
        </div>
    </div>
</div> 
@endsection