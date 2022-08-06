@extends('Backend.layouts.app')
@section('content')
<script src="{{ asset('assets/js/wellbore.js') }}"></script>
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
                    <div class="card-header clearfix">
                        <div class="float-start">
                            {{__('Riser/Casing/Liner-1/Liner-2/Hole')}}
                        </div>
                        <div class="float-end">
                            <button type="button" class="btn btn-primary p-0" id="wellboreUpdateBtn">{{__('Update Wellbore')}}</button>
                        </div>
                    </div>
                    <div class="card-body overflow-auto clearfix">
                        <table id="dataTable" class="table table-responsive">
                            <thead>
                                <tr>
                                    <th class="text-center">{{__('Description')}}</th>
                                    <th class="text-center">{{__('Top MD(ft)')}}</th>
                                    <th class="text-center">{{__('Bottom MD(ft)')}}</th>
                                    <th class="text-center">{{__('ID(in)')}}</th>
                                    <th class="text-center">{{__('OD(in)')}}</th>
                                    <th class="text-center">{{__('Weight(lbs/ft)')}}</th>
                                    <th class="text-center">{{__('Active')}}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <form action="{{route('admin.wellbore.update')}}" id="wellboreUpdateForm" method="POST">
                                    <input type="hidden" name="wellbore_id" value="{{$wellbore->wellboreId}}">
                                    @csrf
                                    <tr @if($rigType == 0 || $rigType == 1 || $rigType == 2) style="display: none" @endif>
                                        <td class="text-center"><input type="text" class="form-control" name="riserDescription" value="{{$wellbore->riser->RiserDescription}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="riserTopMD" value="{{$wellbore->riser->RiserTop}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="riserBottomMD" value="{{$wellbore->riser->RiserBottom}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="riserId" value="{{$wellbore->riser->RiserID}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="riserOd" value="{{$wellbore->riser->RiserOD}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="riserWeight" value="{{$wellbore->riser->RiserWeight}}"></td>
                                        <td class="text-center"><input type="checkbox" @if($wellbore->riser->RiserActive) checked @endif></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center"><input type="text" class="form-control" name="csgDescription" value="{{$wellbore->csg->CsgDescription}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="csgTopMD" value="{{$wellbore->csg->CsgTop}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="csgBottomMD" value="{{$wellbore->csg->CsgBottom}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="csgID" value="{{$wellbore->csg->CsgID}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="csgOD" value="{{$wellbore->csg->CsgOD}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="csgWeight" value="{{$wellbore->csg->CsgWeight}}"></td>
                                        <td class="text-center"> {{__(' ')}} </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center"><input type="text" class="form-control" name="lfirstDescription" value="{{$wellbore->lfirst->L1Description}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="lfirstTopMD" value="{{$wellbore->lfirst->L1Top}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="lfirstBottomMD" value="{{$wellbore->lfirst->L1Bottom}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="lfirstID" value="{{$wellbore->lfirst->L1ID}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="lfirstOD" value="{{$wellbore->lfirst->L1OD}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="lfirstWeight" value="{{$wellbore->lfirst->L1Weight}}"></td>
                                        <td class="text-center"><input type="checkbox" name="lfirstActive" @if($wellbore->lfirst->L1Active) checked @endif value="1"></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center"><input type="text" class="form-control" name="lsecondDescription" value="{{$wellbore->lsecond->L2Description}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="lsecondTopMD" value="{{$wellbore->lsecond->L2Top}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="lsecondBottomMD" value="{{$wellbore->lsecond->L2Bottom}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="lsecondID" value="{{$wellbore->lsecond->L2ID}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="lsecondOD" value="{{$wellbore->lsecond->L2OD}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="lsecondWeight" value="{{$wellbore->lsecond->L2Weight}}"></td>
                                        <td class="text-center"><input type="checkbox" name="lsecondActive" @if($wellbore->lsecond->L2Active) checked @endif value="1"></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center"><input type="text" class="form-control" name="holeDescription" value="{{$wellbore->hole->HoleDescription}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="holeTopMD" value="{{$wellbore->hole->HoleTop}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="holeBottomMD" value="{{$wellbore->hole->HoleBottom}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="holeID" value="{{$wellbore->hole->HoleID}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="holeOD" value="{{$wellbore->hole->HoleOD}}"></td>
                                        <td class="text-center"><input type="text" class="form-control" name="holeWeight" value="{{$wellbore->hole->HoleWeight}}"></td>
                                        <td class="text-center">{{__(' ')}}</td>
                                    </tr>
                                </form>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-md-12 col-lg-5">
                        @php
                            if (session()->has('selectedDrillString')) {
                                $selectedDrillStringInfo = session()->get('selectedDrillString');
                            }
                        @endphp
                        <div class="card">
                            <div class="card-header clearfix">
                                <div class="float-start">{{__('Bit Information')}}</div>
                                <div class="float-end">{{'Section: '}}@if(isset($selectedDrillStringInfo)) {{$selectedDrillStringInfo->Description}} @endif</div>
                            </div>
                            <div class="card-body overflow-auto clearfix">
                                <form name="selectDsDesc" action="{{route('admin.drillstring.getdrillstringData')}}" id="selectDsDesc" method="POST">
                                    @csrf
                                    <label for="DrillString Description" class="form-label">{{__('DrillString Description')}}</label>
                                    <select name="drillstringId" id="selectedDrillstringId" class="form-select">
                                        @foreach ($drillstring as $item)
                                            @php
                                                $selected = '';
                                                if(isset($selectedDrillStringInfo))
                                                    if ($item->DS_ID == $selectedDrillStringInfo->DS_ID) {
                                                        $selected = 'selected';
                                                    }
                                            @endphp
                                            <option value="{{$item->DS_ID}}" {{$selected}}>{{__($item->Description)}}</option>
                                        @endforeach
                                    </select>
                                </form>
                                <div class="row">
                                    <div class="col-md-12 col-lg-5">
                                        <div>
                                            @php
                                                $types = ['None', 'Roller-Cones', 'Diamond'];
                                            @endphp
                                            <label for="type" class="form-label">Type</label>
                                            <select class="form-select" id="selectedBitType">
                                                @foreach ($types as $key => $item)
                                                    @php
                                                        $selected = '';
                                                        if(isset($selectedDrillStringInfo))
                                                            if ($key == $selectedDrillStringInfo->Bit_type) {
                                                                $selected = 'selected';
                                                            }
                                                    @endphp
                                                    <option value="{{$key}}" {{$selected}}> {{$item}} </option>
                                                @endforeach
                                            </select>
                                            <label for="position" class="form-label">Position</label>
                                            <input type="number" class="form-control" id="inputPosition" name="position" @if(isset($selectedDrillStringInfo)) value="{{$selectedDrillStringInfo->Bit_position}}" @endif>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-lg-7">
                                        @php
                                            $nozzles = \DB::table('nozzle')->where('DS_ID', $selectedDrillStringInfo->DS_ID)->get();
                                        @endphp
                                        <table id="dataTable" class="table table-responsive nozzletable">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">No. of Nozzles</th>
                                                    <th class="text-center">Size(1/32 in)</th>
                                                    {{-- <th class="text-center">
                                                        <button type="button" class="btn btn-primary p-0" data-bs-toggle="modal"
                                                            data-bs-target="#addNozzlesModal">
                                                            + Add
                                                        </button>
                                                    </th> --}}
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($nozzles as $item)
                                                    <tr>
                                                        <td class="text-center">{{$loop->iteration}}</td>
                                                        <td class="text-center">{{$item->size}}</td>
                                                    </tr>
                                                @endforeach                                                    
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="clearfix">
                                    <div class="float-start col-md-4">
                                        <label for="size" class="form-label">Size</label>
                                        <input type="text" class="form-control" id="inputSize" name="size" @if(isset($selectedDrillStringInfo)) value="{{$selectedDrillStringInfo->Bit_Size}}" @endif>
                                    </div>
                                    <div class="form-check float-start col-md-4 mt-4">
                                        <label for="tfa" class="form-check-label">TFA</label>
                                        <input type="checkbox" class="form-check-input" id="tfa_checkbox" name="tfa">
                                    </div>
                                    <div class="float-end col-md-4">
                                        <label for="tfa" class="form-label">in2</label>
                                        <input type="text" class="form-control" name="tfain2" id="tfain2" @if(isset($selectedDrillStringInfo)) value="{{$selectedDrillStringInfo->Bit_TFA}}" @endif>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-4">
                        <div class="card">
                            <div class="card-header clearfix">
                                <div class="float-start">
                                    {{__('Surface Piping')}}
                                </div>
                                <div class="float-end">
                                    <button type="button" class="btn btn-secondary p-0" data-bs-toggle="modal" data-bs-target="#addSurfpipingModal"> +Add Surfpiping</button>
                                </div>
                            </div>
                            <div class="card-body overflow-auto clearfix">
                                <table id="dataTable" class="table table-responsive">
                                    <thead>
                                        <tr>
                                            <th class="text-center">{{__('#')}}</th>
                                            <th class="text-center"> {{__('Length(ft)')}} </th>
                                            <th class="text-center"> {{__('ID(in)')}} </th>
                                            <th class="text-center"> {{__('Action')}} </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($surfpiping as $item)
                                            <tr>
                                                <td class="text-center">{{$loop->iteration}}</td>
                                                <td class="text-center"> {{$item->Length}} </td>
                                                <td class="text-center"> {{$item->ID}} </td>
                                                <td class="text-center">
                                                    <div class="btn-group" role="group" aria-label="Basic example">
                                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                            data-bs-target="#deleteSurfpiping{{$item->SurfID}}">
                                                            <i class="fas fa-trash"></i>
                                                        </button>

                                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                            data-bs-target="#editSurfpiping{{$item->SurfID}}">
                                                            <i class="fas fa-pencil-alt"></i>
                                                        </button>
                                                    </div>
                                                    {{-- delete modal --}}
                                                    <div class="modal fade" id="deleteSurfpiping{{ $item->SurfID }}" data-bs-backdrop="static"
                                                        data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                                                        aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                            <form action="{{ route('admin.surfpiping.destroy') }}" method="post" id="deleteSurfpiping{{ $item->SurfID }}">
                                                                @csrf
                                                                <input type="hidden" name="surfid" value="{{ $item->SurfID }}">
                                                                <div class="p-4 text-center">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="56" height="56" fill="currentColor"
                                                                    class="bi bi-exclamation-circle text-danger" viewBox="0 0 16 16">
                                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                                                    <path
                                                                    d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
                                                                </svg>
                                                                <div class="h3 text-danger mt-3">Are you sure?</div>
                                                                <p class="mb-4">
                                                                    You will lose all data that is related to this project
                                                                </p>
                                                                <div class="d-flex align-items-center justify-content-center">
                                                                    <button type="button" class="btn btn-success me-4 px-5"
                                                                    data-bs-dismiss="modal">No</button>
                                                                    <button type="submit" class="btn btn-danger px-5">Yes</button>
                                                                </div>
                                                                </div>
                                                            </form>
                                                            </div>
                                                        </div>
                                                        </div>
                                                    </div>
                                                    {{-- delete modal --}}
                                                    {{-- edit modal --}}
                                                    <div class="modal fade" id="editSurfpiping{{ $item->SurfID }}" data-bs-backdrop="static"
                                                        data-bs-keyboard="false" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-lg">
                                                        <div class="modal-content">
                                                            <form action="{{ route('admin.surfpiping.update') }}" method="post">
                                                            @csrf
                                                            <input type="hidden" name="surfId" value="{{ $item->SurfID }}">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="editModalLabel">Edit {{ __('SurfPiping') }}</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="row gy-3">
                                                                <div class="col-md-6">
                                                                    <label for="" class="form-label">Length</label>
                                                                    <input type="text" class="form-control" name="length" value="{{ $item->Length }}"
                                                                    required>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label for="" class="form-label">ID</label>
                                                                    <input type="text" class="form-control" name="id" value="{{ $item->ID }}"
                                                                    required>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary">Submit</button>
                                                            </div>
                                                            </form>
                                                        </div>
                                                        </div>
                                                    </div>
                                                    {{-- edit modal --}}
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-3">
                        <div class="text-center mt-4">
                            <button type="button" class="btn btn-primary" id="update_btn">{{'Update'}}</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <div id="divplot"></div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="addSurfpipingModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addSurfpipingModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <form action="{{ route('admin.surfpiping.store') }}" method="post">
                @csrf
                <input type="hidden" name="user_id" value="{{ 'Auth::user()->id' }}">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">+ Add {{ __('Surfpiping') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row gy-3">
                        <div class="col-md-6">
                            <label for="" class="form-label">ID</label>
                            <input type="text" class="form-control" name="id" required>
                        </div>
                        <div class="col-md-6">
                            <label for="" class="form-label">Length</label>
                            <input type="text" class="form-control" name="length" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>

{{-- <div class="modal fade" id="addNozzlesModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addNozzlesModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <form action="{{ route('admin.nozzle.store') }}" method="post">
            @csrf
            <input type="hidden" name="ds_id" @if(isset($selectedDrillStringInfo)) value="{{$selectedDrillStringInfo->DS_ID}}" @endif>
            <div class="modal-header">
                <h5 class="modal-title" id="addNozzlesModalLabel">+ Add {{ __('Nozzle') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row gy-3">
                    <div class="col-md-12">
                        <label for="" class="form-label">SIZE</label>
                        <input type="text" class="form-control" name="size" required>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            </form>
        </div>
    </div>
</div> --}}
@endsection