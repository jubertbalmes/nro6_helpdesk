@extends('layouts.app', ['activePage' => 'category-management', 'menuParent' => 'laravel', 'titlePage' => __('Category Management')])

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
                  <i class="material-icons">category</i>
                  <h4 class="card-titleX">{{ __('Issue Type') }}</h4>
                </div>
              </div>
            </div>
            <div class="card-body">
              @can('create', App\Category::class)
                <div class="row">
                  <div class="col-12 text-right">
                    <a href="{{ route('category.create') }}" class="btn btn-sm btn-info">{{ __('Add Type') }}</a>
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
                      {{ __('Description') }}
                    </th>
                    <th class="desktop">
                      {{ __('Category') }}
                    </th>
                    <th class="desktop">
                      {{ __('Mandays') }}
                    </th>
                    <th class="desktop">
                      {{ __('Creation date') }}
                    </th>
                    @can('manage-items', App\User::class)
                      <th class="text-right desktop">
                        {{ __('Actions') }}
                      </th>
                    @endcan
                  </thead>
                  <tbody>
                    @foreach($categories as $category)
                      <tr>
                        <td>
                          {{ $category->name }}
                        </td>
                        <td>
                          {{ $category->description }}
                        </td>
                        <td>
                          {{ $category->maincategory->name }}
                        </td>
                        <td>
                          {{ $category->man_day }}
                        </td>
                        <td>
                          {{ $category->created_at->format('Y-m-d g:i:s A') }}
                        </td>
                        @can('manage-items', App\User::class)
                          <td class="td-actions text-right">
                            <form action="{{ route('category.destroy', $category) }}" method="post">
                              @csrf
                              @method('delete')
                              
                              @can('update', $category)
                                <a rel="tooltip" class="btn btn-success btn-link" href="{{ route('category.edit', $category) }}" data-original-title="" title="">
                                  <i class="material-icons">edit</i>
                                  <div class="ripple-container"></div>
                                </a>
                              @endcan
                              @if ($category->items->isEmpty() && auth()->user()->can('delete', $category))
                                <button type="button" class="btn btn-danger btn-link" data-original-title="" title="" onclick="confirm('{{ __("Are you sure you want to delete this category?") }}') ? this.parentElement.submit() : ''">
                                    <i class="material-icons">close</i>
                                    <div class="ripple-container"></div>
                                </button>
                              @endif
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
    console.log({!! json_encode($errors) !!});
    $(document).ready(function() {
      @if ($errors->has('with_attached_item'))
        $.notify({
          icon: "close",
          message: "{{ $errors->first('with_attached_item') }}"
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
          searchPlaceholder: "Search issue types",
        },
        "columnDefs": [
          { "orderable": false, "targets": 5 },
        ],
      });
      $('#pendingApprovalA').hide();
    });
  </script>
@endpush