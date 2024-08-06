@extends('layouts.app', ['activePage' => 'view_archive', 'menuParent' => 'laravel', 'titlePage' => __('Archive Management')])

@section('content')
  <div class="content rempm">
    <div class="container-fluid">
      <div class="row">

        <div id="CssLoader">
          <div class='spinftw'></div>
        </div>


        <div class="col-md-12">
          <div class="card mb-8">
            <div class="card-header card-header-rose card-neda">
              <div class="card-body">
                <div class="row">
                  <i class="material-icons">inventory</i>
                  <h4 class="card-titleX">{{ __('Archive') }}</h4>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table id="datatables" class="table table-striped table-no-bordered table-hover" style="display:none">
                  <thead class="text-primary">
                    <th class="desktop">
                      {{ __('Reference #') }}
                    </th>
                    <th class="desktop">
                      {{ __('Reported By') }}
                    </th>
                    <th class="desktop">
                      {{ __('Issue/Request') }}
                    </th>
                    <th class="desktop">
                      {{ __('Priority') }}
                    </th>
                    <th class="desktop">
                      {{ __('Status') }}
                    </th>
                    <th class="desktop">
                      {{ __('Assigned To') }}
                    </th>
                    <th class="desktop">
                      {{ __('') }}
                    </th>
                    <th class="desktop">
                      {{ __('Created At') }}
                    </th>
                    <th class="text-center desktop">
                      {{ __('Actions') }}
                    </th>
                  </thead>
                  <tbody>
                    @foreach($archives as $archive)
                      <tr>
                        <td class="text-left">
                          {{ $archive->reff_no }}
                        </td>
                        <td class="align-top">
                          {{ $archive->user->name }}
                        </td>
                        <td>
                          @if($archive->category_id == null)
                            {{ $archive->category_id }}
                          @else
                            {{ $archive->category->name }}
                          @endif
                        </td>
                        <td>
                          {{ $archive->prioritydesc() }}
                        </td>
                        <td>
                          {{ $archive->mstatus->status }}
                        </td>
                        <td>
                          @if($archive->resolver_id == null)
                            {{ $archive->resolver_id }}
                          @else
                            {{ $archive->resolver == null ? '' : $archive->resolver->name }} 
                          @endif
                        </td>
                        <td>
                          
                        </td>
                        {{-- <td>
                          {{ $archive->created_at->format('Y-m-d h:m:s A') }}
                        </td> --}}
                        <td>
                          {{ $archive->created_at->format('Y-m-d g:i:s A') }}
                        </td>
                        <td class="td-actions text-center">

                          @can('restore', App\User::class)
                            <button type="button" class="btn btn-success btn-link" data-original-title="" onclick="confirm('Are you sure you want to restore this archive?') ? document.getElementById('frmRestore').submit() : ''">
                              <i title="Restore" class="material-icons">restore</i>
                              <div class="ripple-container"></div>
                            </button>
                          @endcan
                          
                          @can('deletepermanently', $archive)
                            <button type="button" class="btn btn-danger btn-link" data-original-title="" onclick="confirm('Are you sure you want to delete this archive?') ? document.getElementById('frmDelete').submit() : ''">
                              <i title="Delete" class="material-icons">close</i>
                              <div class="ripple-container"></div>
                            </button>
                          @endcan


                          @can('restore', App\User::class)
                            <form id="frmRestore" action="{{ route('archive.restore', $archive) }}" method="post">
                              @csrf
                              @method('post')
                            </form>
                          @endcan
                          
                          @can('deletepermanently', $archive)
                            <form id="frmDelete" action="{{ route('archive.destroy', $archive) }}" method="post">
                              @csrf
                              @method('delete')
                            </form>
                          @endcan
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
    </div>
  </div>
@endsection

@push('js')
  <script>
    console.log({!! json_encode($errors) !!});
    $(document).ready(function() {
      @if ($errors->has('error_message'))
        $.notify({
          icon: "close",
          message: "{{ $errors->first('error_message') }}"
        }, {
          type: 'danger',
          timer: 3000,
          placement: {
            from: 'top',
            align: 'right'
          }
        });
      @endif
      $('#datatables').fadeIn(1100);
      $('#datatables').DataTable({
        "pagingType": "full_numbers",
        "lengthMenu": [
          [10, 25, 50, -1],
          [10, 25, 50, "All"]
        ],
        responsive: false,
        language: {
          search: "_INPUT_",
          searchPlaceholder: "Search archive",
        },
        "columnDefs": [
          { "orderable": false, "targets": 5 },
        ],
      });
      $('#pendingApprovalA').hide();
    });
  </script>
@endpush