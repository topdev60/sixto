@extends('layouts.app')
<link href="{{asset('assets/css/custom.css')}}" rel="stylesheet">
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <form method="POST" action="{{ route('login') }}">
                    @csrf
                    <div class="card-header login-card-header">{{ __('Sign In') }}</div>
                    <div class="card-body login-card-body">

                        <div class="col-md-12 mb-4 login-input mt-4">
                            <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" placeholder="{{__('User Email')}}" autofocus>

                            @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>


                        <div class="col-md-12 mb-4 login-input">
                            <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="{{__('Password')}}" required autocomplete="current-password">

                            @error('password')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>
                    <div class="card-body login-card-footer">
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-primary btn-login mt-3">
                                {{ __('Sign me in') }}
                            </button>

                            @if (Route::has('password.request'))
                                <div class="forgot-password mt-4 text-right">
                                    {{ __('Forgot Password?') }}
                                    <a class="btn btn-link btn-forgot-password" href="{{ route('password.request') }}">
                                        {{ __('Click Here') }}
                                    </a>
                                </div>
                            @endif
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
