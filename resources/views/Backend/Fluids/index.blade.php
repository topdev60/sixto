@extends('Backend.layouts.app')
@section('content')
<section class="home-section" id="home-section">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between mb-3">
            <div class="h4 mb-0">
                {{$module}}
            </div>
        </div>
        <div class="row gy-4">
            <div class="col-md-12 col-lg-8">
                <div class="card">
                    <div class="card-header"></div>
                    <div class="card-body"></div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection