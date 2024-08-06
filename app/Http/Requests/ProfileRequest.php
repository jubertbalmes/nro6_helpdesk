<?php

namespace App\Http\Requests;

use App\User;
use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class ProfileRequest extends FormRequest
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
            'name' => ['required', 'min:3', 'max:255'],
            'email' => ['required', 'email', 'max:255', Rule::unique((new User)->getTable())->ignore(auth()->id())],
            'staff_id' => ['required', 'max:11'],
            'voip' => ['nullable', 'string', 'max:50'],
            'photo' => ['nullable', 'image'],
        ];
    }

    public function messages()
    {
        return [
            'email.ends_with' => 'Use NEDA email only',
        ];
    }
}
