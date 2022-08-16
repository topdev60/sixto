@extends('Backend.layouts.app')
@section('content')
<input type="hidden" name="selectedSampleID" value="{{session()->get('selectedSampleID')}}">
<section class="home-section" id="home-section">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between mb-3">
            <div class="h4 mb-0">
            </div>
        </div>
        {{------ User table -----}}
        <div class="row gy-4">
            <div class="col-md-12 col-lg-12">
                <div class="card">
                    <div class="card-header clearfix">
                        <div class="float-start">
                            {{__('User Management')}}
                        </div>
                        {{-- <div class="float-end">
                            <button type="submit" class="btn btn-primary p-0" id="UpdateUsers">{{__('Update')}}</button>
                        </div> --}}
                    </div>
                    <div class="card-body overflow-auto clearfix">
                        <table class="table table-responsive" id="dataTable">
                            <thead>
                                <tr>
                                    <th class="text-center">{{__('No')}}</th>
                                    <th class="text-center">{{__('Name')}}</th>
                                    <th class="text-center">{{__('Email')}}</th>
                                    <th class="text-center">{{__('Role')}}</th>
                                    <th class="text-center">{{__('Active')}}</th>
                                    <th class="text-center">{{__('Created At')}}</th>
                                    <th class="text-center">{{__('Updated At')}}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($users as $item)
                                    <tr>
                                        <td class="text-center">{{__($loop->iteration)}}</td>
                                        <td class="text-center">{{__($item->name)}}</td>
                                        <td class="text-center">{{__($item->email)}}</td>
                                        <td class="text-center">
                                            @if($item->role)
                                                {{__('Admin')}}
                                            @else
                                                {{__('User')}}
                                            @endif
                                        </td>
                                        <td class="text-center">
                                            @if($item->permission)
                                                {{__('Actived')}}
                                            @else
                                                {{__('DeActived')}}
                                            @endif
                                        </td>
                                        <td class="text-center">{{__($item->created_at->diffForHumans())}}</td>
                                        <td class="text-center">{{__($item->updated_at->diffForHumans())}}</td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                            data-bs-target="#editModal{{$item->id}}">
                                            <i class="fas fa-pencil-alt"></i>
                                            </button>
                                            {{-- edit modal --}}
                                            <div class="modal fade" id="editModal{{ $item->id }}" data-bs-backdrop="static"
                                                data-bs-keyboard="false" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                                <div class="modal-content">
                                                    <form action="{{ route('admin.usermanagement.update') }}" method="POST">
                                                    @csrf
                                                    <input type="hidden" name="id" value="{{ $item->id }}">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="editModalLabel">{{ __('Edit User Permission') }}</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="row gy-3">
                                                            <div class="col-md-3"></div>
                                                            <div class="col-md-6">
                                                                @php
                                                                    $permArr = ['DeActive', 'Active'];
                                                                @endphp
                                                                <label for="" class="form-label">Permission</label>
                                                                <select name="permission" class="form-control" required>
                                                                    @foreach ($permArr as $key => $value)
                                                                        @php
                                                                            $selected = '';
                                                                            if($item->permission == $key) $selected = 'selected';
                                                                        @endphp
                                                                        <option value="{{$key}}" {{$selected}}>{{$value}}</option>
                                                                    @endforeach
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3"></div>
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
        </div>
    </div>
</section>
@endsection