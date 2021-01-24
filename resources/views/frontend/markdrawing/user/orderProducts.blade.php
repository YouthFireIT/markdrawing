<thead>
  <tr>
      <th>#</th>
      <th>Product Name</th>
      <th>Work Status</th>
  </tr>
</thead>

<tbody>
  @foreach ($orderProducts as $orderProduct)
    <tr>
      <td>{{ $loop->index + 1 }}</td>
      @php
          $product = App\Product::find($orderProduct->products_id);
      @endphp
      <td>{{ $product->title }}</td>
      <td>
        @if($orderProduct->is_image_comp == 1)
          <input class="form-check-input" type="checkbox" checked="checked" disabled>
          <label class="form-check-label" for="">Image Complete</label>
        @endif
        @if($orderProduct->is_option_comp == 1)
          <input class="form-check-input" type="checkbox" checked="checked" disabled>
          <label class="form-check-label" for="">Option Complete</label>
        @endif
        @if($orderProduct->is_print_comp == 1)
          <input class="form-check-input" type="checkbox" checked="checked" disabled>
          <label class="form-check-label" for="">Print Complete</label>
        @endif
      </td>                            
    </tr>
  @endforeach
</tbody>