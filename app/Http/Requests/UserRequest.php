<?php

namespace App\Http\Requests;

use App\Role;
use App\User;
use App\Staff;
use App\Position;
use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
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
        // , 'ends_with:@neda.gov.ph'
        return [
            'name' => [
                'required', 'min:3', 'max:255'
            ],
            'email' => [
                'required', 'email', 'max:255', Rule::unique((new User)->getTable())->ignore($this->route()->user->id ?? null)
            ],
            'staff_id' => [
                'required', 'exists:' . (new Staff)->getConnectionName() . '.' . (new Staff)->getTable() . ',id'
            ],
            'position_id' => [
                'required', 'exists:' . (new Position)->getConnectionName() . '.' . (new Position)->getTable().',id'
            ],
            'voip' => [
                'nullable', 'string', 'max:50'
            ],
            'status' => [
                'required', 'in:0,1,2'
            ],
            'role_id' => [
                'required', 'exists:' . (new Role)->getTable(). ',id'
            ],
            'password' => [
                $this->route()->user ? 'nullable' : 'required', 'confirmed', 'min:6'
            ]
        ];
    }

    public function messages()
    {
        return [
            'email.ends_with' => 'Use NEDA email only',
        ];
    }

    /**
     * Get the validation attributes that apply to the request.
     *
     * @return array
     */
    public function attributes()
    {
        return [
            'role_id' => 'role',
        ];
    }
}
