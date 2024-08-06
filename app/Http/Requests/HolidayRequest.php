<?php

namespace App\Http\Requests;

use App\Holiday;
use App\User;
use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class HolidayRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return auth()->check() && auth()->user()->can('manage-holidays');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        // , 'ends_with:@neda.gov.ph'
        return [
            'name' => [
                'required', 'max:255', Rule::unique((new Holiday)->getTable())->ignore($this->route()->holiday->id ?? null)
            ],
            'date' => [
                'required', 'date'
            ],
            'repeat' => [
                'required', 'numeric', 'in:0,1'
            ]
        ];
    }

    public function messages()
    {
        return [
            'repeat.required' => 'Indicate if repeat every year',
            'repeat.numeric' => 'Indicate if repeat every year',
            'repeat.in' => 'Indicate if repeat every year',
        ];
    }
}
