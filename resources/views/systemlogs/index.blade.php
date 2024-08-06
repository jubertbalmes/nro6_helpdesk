@extends('layouts.app', ['activePage' => 'view-logs', 'menuParent' => 'laravel', 'titlePage' => __('System Logs')])

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
                  <i class="material-icons">receipt</i>
                  <h4 class="card-titleX">{{ __('System Logs') }}</h4>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table id="datatables" class="table table-striped table-no-bordered table-hover datatable-primary" style="display:none">
                  <thead class="text-primary">
                    <th class="desktop">
                      {{ __('Username') }}
                    </th>
                    <th class="desktop">
                      {{ __('Role') }}
                    </th>
                    <th class="desktop">
                      {{ __('Activity') }}
                    </th>
                    <th class="desktop">
                      {{ __('Creation date') }}
                    </th>
                  </thead>
                  <tbody>
                    @foreach($systemlogs as $log)
                      <tr>
                        <td>
                          @if($log->user != null)
                            {{ $log->user->name }}
                          @endif
                        </td>
                        <td>
                          @if($log->role_id != null)
                            @if($log->user != null)
                            {{ $log->user->role->name }}
                          @endif
                          @endif
                        </td>
                        <td>
                          {{ $log->remarks }}
                        </td>
                        <td>
                          {{ $log->created_at->format('Y-m-d H:i:s') }}
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
    $(document).ready(function() {
      $('#datatables').fadeIn(1100);
      $('#datatables').DataTable({
        "order": [[3, 'desc']],
        "pagingType": "full_numbers",
        "lengthMenu": [
          [10, 25, 50, -1],
          [10, 25, 50, "All"]
        ],
        responsive: false,
        language: {
          search: "_INPUT_",
          searchPlaceholder: "Search logs",
        },
        "columnDefs": [
          { "orderable": false, "targets": null },
        ],
      });
      $('#pendingApprovalA').hide();
    });
  </script>
@endpush