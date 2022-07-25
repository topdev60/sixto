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

                        {{-- <div class="row mb-3"> --}}
                            {{-- <label for="email" class="col-md-4 col-form-label text-md-end">{{ __('User Email Address') }}</label> --}}

                            <div class="col-md-12 mb-4 login-input mt-4">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" placeholder="{{__('User Email')}}" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        {{-- </div> --}}

                        {{-- <div class="row mb-3"> --}}
                            {{-- <label for="password" class="col-md-4 col-form-label text-md-end">{{ __('Password') }}</label> --}}

                            <div class="col-md-12 mb-4 login-input">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="{{__('Password')}}" required autocomplete="current-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        {{-- </div> --}}

                        <div class="login-card-footer">
                            <div class="col-md-8 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Login') }}
                                </button>

                                @if (Route::has('password.request'))
                                    <a class="btn btn-link" href="{{ route('password.request') }}">
                                        {{ __('Forgot Your Password?') }}
                                    </a>
                                @endif
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
