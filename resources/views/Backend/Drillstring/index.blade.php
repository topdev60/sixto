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
                    <div class="card-header"> {{__('Drill String (Top to Bottom)')}} </div>
                    <div class="card-body overflow-auto clearfix">
                        <table id="dataTable" class="table table-responsive">
                            <thead>
                                <tr>
                                    <th class="text-center"> {{__('Description')}} </th>
                                    <th class="text-center"> {{__('OD(in)')}} </th>
                                    <th class="text-center"> {{__('ID(in)')}} </th>
                                    <th class="text-center"> {{__('Weight(lb/ft)')}} </th>
                                    <th class="text-center"> {{__('Length(ft)')}} </th>
                                    <th class="text-center"> {{__('Used(ft)')}} </th>
                                    <th class="text-center"> {{__('Press Drop Known')}} </th>
                                    <th class="text-center"> {{__('Press Drop(psi)')}} </th>
                                    <th class="text-center"> {{__('Img')}} </th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection