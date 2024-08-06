@extends('layouts.app', ['activePage' => 'category-management', 'menuParent' => 'laravel', 'titlePage' => __('Issue Type Management')])

@section('content')
  <div class="content rempm">
    <div class="container-fluid">
      <div class="row">

        <div id="CssLoader">
          <div class='spinftw'></div>
        </div>


        <div class="col-md-12">
          <form method="post" action="{{ route('category.store') }}" autocomplete="off" class="form-horizontal frm-prevent-multiple-submit">
            @csrf
            @method('post')
              <div class="card mb-8">
                <div class="card-header card-header-rose card-neda">
                  <div class="card-body">
                    <div class="row">
                      <i class="material-icons">category</i>
                      <h4 class="card-titleX">{{ __('Add Issue Type') }}</h4>
                    </div>
                  </div>
                </div>
              <div class="card-body ">
                <div class="row">
                  <div class="col-md-12 text-right">
                      <a href="{{ route('category.index') }}" class="btn btn-sm btn-info">{{ __('Back to list') }}</a>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Name :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('name') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" id="input-name" type="text" placeholder="{{ __('Name') }}" value="{{ old('name') }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'name'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Description :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('description') ? ' has-danger' : '' }}">
                      <textarea cols="30" rows="2" class="form-control{{ $errors->has('description') ? ' is-invalid' : '' }}" name="description" id="input-description" type="text" placeholder="{{ __('Description') }}" required="true" aria-required="true">{{ old('description') }}</textarea>
                      @include('alerts.feedback', ['field' => 'description'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Category :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('main_id') ? ' has-danger' : '' }}">
                      <select class="selectpicker col-sm-12 pl-0 pr-0" name="main_id" data-live-search="true" data-style="select-with-transition" title=" " data-size="6" required="true" aria-required="true">
                        @foreach ($maincategories as $category)
                          <option value="{{$category->id}}" @if (old('main_id') == $category->id) selected @endif>{{ $category->name }}</option>
                        @endforeach
                      </select>
                      @include('alerts.feedback', ['field' => 'main_id'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Mandays :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('man_day') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('man_day') ? ' is-invalid' : '' }}" name="man_day" id="input-man_day" type="number" placeholder="{{ __('Man-day') }}" value="{{ old('man_day') }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'man_day'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Troubleshooting Steps :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('ts') ? ' has-danger' : '' }}">
                      <textarea cols="30" rows="10" class="form-control{{ $errors->has('ts') ? ' is-invalid' : '' }}" name="ts" id="input-ts" placeholder="{{ __('Troubleshooting Steps') }}">{{ old('ts') }}</textarea>
                      @include('alerts.feedback', ['field' => 'ts'])
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ml-auto mr-auto">
                <button type="submit" class="btn btn-info btn-prevent-multiple-submit">{{ __('Save') }}</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
@endsection


@push('js')
  <script>
    $(document).ready(function() {
      $('#pendingApprovalA').hide();
    });
  </script>
@endpush