@extends('Backend.layouts.app')
@section('content')
<section class="home-section" id="home-section">
    <div class="container-fluid">
        {{---title---}}
        <div class="d-flex align-items-center justify-content-between mb-3">
            <div class="h4 mb-0">
                {{$module}}
            </div>
            <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#addModal"> Switch 2D/3D {{$module}} </button>
        </div>
        {{---title---}}
        <div class="row gy-4">
            <div class="col-md-12 col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <div>{{__('Trajectory Points')}}</div>
                    </div>
                    <div class="card-body overflow-auto">
                        <table id="dataTable" class="table table-responsive">
                            
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <div class="bg-secondary rounded p-3">
                    DIV PLOT
                </div>
            </div>
        </div>
    </div>
</section>
@endsection