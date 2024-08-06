<?php

namespace App\Http\Requests;

use App\Category;
use App\MainCategory;
use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class CategoryRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return auth()->check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => [
                'required', 'min:3', Rule::unique((new Category)->getTable())->ignore($this->route()->category->id ?? null)
            ],
            'man_day' => [
                'required', 'numeric', 'min:1', 'max:31'
            ],
            'description' => [
                'nullable', 'min:5'
            ],
            'main_id' => [
                'required', 'exists:' . (new MainCategory)->getConnectionName() . '.' . (new MainCategory)->getTable() . ',id'
            ],
            'ts' => [
                'nullable', 'max:1000'
            ]
        ];
    }
}
