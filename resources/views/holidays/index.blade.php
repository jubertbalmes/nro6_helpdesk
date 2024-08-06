@extends('layouts.app', ['activePage' => 'holiday-management', 'menuParent' => 'laravel', 'titlePage' => __('Holiday Management')])

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
                  <i class="material-icons">card_travel</i>
                  <h4 class="card-titleX">{{ __('Holidays') }}</h4>
                </div>
              </div>
            </div>
            <div class="card-body">
              @can('create', App\Holiday::class)
                <div class="row">
                  <div class="col-12 text-right">
                    <a href="{{ route('holiday.create') }}" class="btn btn-sm btn-info">{{ __('Add Holiday') }}</a>
                  </div>
                </div>
              @endcan
              <div class="table-responsive">
                <table id="datatables" class="table table-striped table-no-bordered table-hover datatable-primary" style="display:none">
                  <thead class="text-primary">
                    <th class="desktop">
                        {{ __('Name') }}
                    </th>
                    <th class="desktop">
                      {{ __('Date') }}
                    </th>
                    <th class="desktop">
                      {{ __('Repeat') }}
                    </th>
                    <th class="desktop">
                      {{ __('Creation date') }}
                    </th>
                    @can('manage-holidays', App\User::class)
                      <th class="text-right desktop">
                        {{ __('Actions') }}
                      </th>
                    @endcan
                  </thead>
                  <tbody>
                    @foreach($holidays as $holiday)
                      <tr>
                        <td>
                          {{ $holiday->name }}
                        </td>
                        <td>
                          {{ $holiday->date }}
                        </td>
                        <td>
                          {{ $holiday->repeat }}
                        </td>
                        <td>
                          {{ $holiday->created_at->format('Y-m-d g:i:s A') }}
                        </td>
                        @can('manage-holidays', App\User::class)
                          <td class="td-actions text-right">
                            <form action="{{ route('holiday.destroy', $holiday) }}" method="post">
                              @csrf
                              @method('delete')
                              
                              @can('update', $holiday)
                                <a rel="tooltip" class="btn btn-success btn-link" href="{{ route('holiday.edit', $holiday) }}" data-original-title="" title="">
                                  <i class="material-icons">edit</i>
                                  <div class="ripple-container"></div>
                                </a>
                              @endcan
                              @can('delete', $holiday)
                                <button type="button" class="btn btn-danger btn-link" data-original-title="" title="" onclick="confirm('{{ __("Are you sure you want to delete this category?") }}') ? this.parentElement.submit() : ''">
                                    <i class="material-icons">close</i>
                                    <div class="ripple-container"></div>
                                </button>
                                @endcan
                            </form>
                          </td>
                        @endcan
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
    $(document).ready(function() {
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
          searchPlaceholder: "Search holidays",
        },
        "columnDefs": [
          { "orderable": false, "targets": 4 },
        ],
      });
      $('#pendingApprovalA').hide();
    });
  </script>
@endpush