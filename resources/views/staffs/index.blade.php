@extends('layouts.app', ['activePage' => 'staff-management', 'menuParent' => 'laravel', 'titlePage' => __('Staff Management')])

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
                  <i class="material-icons">recent_actors</i>
                  <h4 class="card-titleX">{{ __('Staff') }}</h4>
                </div>
              </div>
            </div>
            <div class="card-body">
              @can('create', App\Staff::class)
                <div class="row">
                  <div class="col-12 text-right">
                    <a href="{{ route('staff.create') }}" class="btn btn-sm btn-info">{{ __('Add Staff') }}</a>
                  </div>
                </div>
              @endcan
              <div class="table-responsive">
                <table id="datatables" class="table table-striped table-no-bordered table-hover" style="display:none">
                  <thead class="text-primary">
                    <th class="desktop">
                      {{ __('Name') }}
                    </th>
                    <th class="desktop">
                      {{ __('Abbreviation') }}
                    </th>
                    <th class="desktop">
                      {{ __('VoIP') }}
                    </th>
                    @can('manage-staffs', App\User::class)
                      <th class="text-right desktop">
                        {{ __('Actions') }}
                      </th>
                    @endcan
                  </thead>
                  <tbody>
                    @foreach($staffs as $staff)
                      <tr>
                        <td>
                          {{ $staff->name }}
                        </td>
                        <td>
                          {{ $staff->abbreviation }}
                        </td>
                        <td>
                          {{ $staff->voip }}
                        </td>
                        @can('manage-staffs', App\User::class)
                          <td class="td-actions text-right">
                            <form action="{{ route('staff.destroy', $staff) }}" method="post">
                              @csrf
                              @method('delete')

                              @can('update', $staff)
                                <a rel="tooltip" class="btn btn-success btn-link" href="{{ route('staff.edit', $staff) }}" data-original-title="" title="">
                                  <i class="material-icons">edit</i>
                                  <div class="ripple-container"></div>
                                </a>
                              @endcan
                              @can('delete', $staff)
                                <button type="button" class="btn btn-danger btn-link" data-original-title="" title="" onclick="confirm('{{ __("Are you sure you want to delete this staff?") }}') ? this.parentElement.submit() : ''">
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
        searchPlaceholder: "Search Staffs",
      },
      "columnDefs": [
        { "orderable": false, "targets": 3 },
      ],
    });
    $('#pendingApprovalA').hide();
  });
</script>
@endpush