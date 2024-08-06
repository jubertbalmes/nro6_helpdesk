<?php

namespace App\Policies;

use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class UserPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can see the users.
     *
     * @param  \App\User  $user
     * @return boolean
     */
    public function viewAny(User $user)
    {
        return $user->isAdmin() || $user->isHOD();
    }

    public function view(User $user, User $model)
    {
        return $user->isAdmin() || ($user->isHOD() && $model->isCreator());
    }

    /**
     * Determine whether the authenticate user can create users.
     *
     * @param  \App\User $user
     * @return boolean
     */
    public function create(User $user)
    {
        return $user->isAdmin();
    }

    /**
     * Determine whether the authenticate user can update the user.
     *
     * @param  \App\User  $user
     * @param  \App\User  $model
     * @return boolean
     */
    public function update(User $user, User $model)
    {
        if (env('IS_DEMO')){
            return $user->isAdmin() && !in_array($model->id, [1, 2, 3]);
        }
        return ($user->isAdmin()) && ($model->status == 1 || $model->status == 2);
    }

    /**
     * Determine whether the authenticate user can delete the user.
     *
     * @param  \App\User  $user
     * @param  \App\User  $model
     * @return boolean
     */
    public function delete(User $user, User $model)
    {
        // if (env('IS_DEMO')){
        //     return $user->isAdmin() && $user->id != $model->id && !in_array($model->id, [1, 2, 3]);
        // }

        return $user->isAdmin() && $user->id != $model->id;
    }

    /**
     * Determine whether the authenticate user can manage other users.
     *
     * @param  \App\User  $user
     * @return boolean
     */
    public function manageUsers(User $user)
    {
        return $user->isAdmin() || $user->isHOD();
    }

    /**
     * Determine whether the authenticate user can manage items and other related entities(tags, categories).
     *
     * @param  \App\User  $user
     * @return boolean
     */
    public function manageItems(User $user)
    {
        return $user->isAdmin() || $user->isCreator();
    }


    public function approve(User $user, User $model)
    {
        return $user->isAdmin() && $model->status == 0;
    }


    public function activate(User $user, User $model)
    {
      // dd('1');
        return $user->isAdmin() || ($user->isHOD() && $model->isCreator());
    }


    public function view_status(User $user)
    {
        return $user->isAdmin() || $user->isHOD();
    }

    public function perform_actions(User $user)
    {
        return $user->isAdmin() || $user->isHOD();
    }

    public function manageHolidays(User $user)
    {
        return $user->isAdmin();
    }

    public function manageStaffs(User $user)
    {
        return $user->isAdmin();
    }

    public function generateReports(User $user) 
    {
        return $user->isAdmin();
    }

    public function manageCategories(User $user) 
    {
        return $user->isAdmin();
    }

    public function viewLogs(User $user) 
    {
        return $user->isAdmin();
    }

    public function managemaincategory(User $user)
    {
        return $user->isAdmin();
    }

    public function view_archive(User $user)
    {
        return $user->isAdmin() || $user->isHOD();
    }

    public function restore(User $user)
    {
        return $user->isAdmin();
    }
}
