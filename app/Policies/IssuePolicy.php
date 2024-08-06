<?php

namespace App\Policies;

use App\Issue;
use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class IssuePolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function viewAny(User $user)
    {
        return true;
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param  \App\User  $user
     * @param  \App\Issue  $issue
     * @return mixed
     */
    public function view(User $user, Issue $issue)
    {
        // if ($issue->resolver_id == null) {
        //     return ($user->id === $issue->user->id && $issue->status != 5) || ($user->isAdmin() || $user->isHOD());
        // }
        // return ($user->id === $issue->user->id && $issue->status != 5) || $user->id === $issue->resolver->id || ($user->isAdmin() || $user->isHOD());
        if ($issue->resolver_id == null) {
            return ($user->id === $issue->user->id) || ($user->isAdmin() || $user->isHOD());
        }
        return ($user->id === $issue->user->id) || $user->id === $issue->resolver->id || ($user->isAdmin() || $user->isHOD());
    }

    /**
     * Determine whether the user can edit models.
     *
     * @param  \App\User  $user
     * @param  \App\Issue  $issue
     * @return mixed
     */
    public function edit(User $user, Issue $issue)
    {
        if ($issue->resolver_id == null) {
            return ($user->id === $issue->user->id && $user->status == 1) || ($user->isAdmin() || $user->isHOD());
        }
        return ($user->id === $issue->user->id && $user->status == 1) || $user->id === $issue->resolver->id || ($user->isAdmin() || $user->isHOD());
    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        return ($user->isMember() && $user->status == 1) || ($user->isAdmin() || $user->isHOD());
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\User  $user
     * @param  \App\Issue  $issue
     * @return mixed
     */
    public function update(User $user, Issue $issue)
    {
        if ($issue->status == 6) {
            return false;
        } else {
            if ($issue->resolver_id == null) {
                return ($user->id === $issue->user->id && $user->status == 1 && $issue->status == 1) || (($user->isAdmin() || $user->isHOD()) && $issue->status != 5);
            }
            return ($user->id === $issue->user->id && $user->status == 1 && $issue->status == 1) || ($user->id === $issue->resolver->id && ($issue->status == 2 || $issue->status == 3)) || (($user->isAdmin() || $user->isHOD())  && $issue->status != 5);
        
        }
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\User  $user
     * @param  \App\Issue  $issue
     * @return mixed
     */
    public function delete(User $user, Issue $issue)
    {
      return ($user->isAdmin() || $user->isHOD()) && ($issue->reff_no == null || substr($issue->reff_no, 0, 4) == 'TEMP') && ($issue->status == 6);
      // return ($user->isAdmin() || $user->isHOD() || ($issue->user_id == $user->id)) && ($issue->reff_no == null || substr($issue->reff_no, 0, 4) == 'TEMP') && ($issue->status == 6);
    }

    
    public function archive(User $user, Issue $issue)
    {
      if ($user->isAdmin() || $user->isHOD() || $issue->user_id == $user->id) {
        if ($issue->user_id == $user->id) {
          return ($issue->reff_no == null || substr($issue->reff_no, 0, 4) == 'TEMP') && ($issue->status == 6);
        } else {
          return (($issue->reff_no == null || substr($issue->reff_no, 0, 4) == 'TEMP') && ($issue->status == 6)) || ($issue->status == 5);
        }
      } else {
        return false;
      }


      // return ($user->isAdmin() || $user->isHOD() || $issue->user_id == $user->id) && ($issue->reff_no == null || substr($issue->reff_no, 0, 4) == 'TEMP') && ($issue->status == 6);
      // return ($user->isAdmin() || $user->isHOD() || ($issue->user_id == $user->id)) && ($issue->reff_no == null || substr($issue->reff_no, 0, 4) == 'TEMP') && ($issue->status == 6);
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\User  $user
     * @param  \App\Issue  $issue
     * @return mixed
     */
    public function restore(User $user, Issue $issue)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\User  $user
     * @param  \App\Issue  $issue
     * @return mixed
     */
    public function forceDelete(User $user, Issue $issue)
    {
        //
    }

    /**
     * Determine whether the user can update status models.
     *
     * @param  \App\User  $user
     * @param  \App\Issue  $issue
     * @return mixed
     */
    public function edit_status(User $user, Issue $issue)
    {
        if ($issue->resolver_id == null) {
            return $user->isAdmin() || $user->isHOD();
        } elseif ($user->id == $issue->resolver->id && $user->id == $issue->user->id) {
            return $user->isAdmin() || $user->isHOD();
        }
        return ($user->id == $issue->resolver->id && $issue->status != 5) || ($user->isAdmin() || $user->isHOD());
        // return $user->id == $issue->resolver->id || ($user->isAdmin() || $user->isHOD());
    }

    /**
     * Determine whether the user can view attachment.
     *
     * @param  \App\User  $user
     * @param  \App\Issue  $issue
     * @return mixed
     */
    public function viewAttachment(User $user, Issue $issue)
    {
        if ($issue->resolver_id == null) {
            return $user->id === $issue->user->id || ($user->isAdmin() || $user->isHOD());
        }
        return $user->id === $issue->user->id || $user->id === $issue->resolver->id || ($user->isAdmin() || $user->isHOD());
    }

    public function reOpenComplete(User $user, Issue $issue)
    {
        return ($issue->status == 4) && $user->id === $issue->user->id;
    }
    
    public function actionRequired(User $user, Issue $issue)
    {
        if($user->isMember()) {
            return $issue->user->id == $user->id && ($issue->status == 4 || $issue->status == 6);
        } elseif ($user->isCreator()) {
            return ($issue->user->id == $user->id && ($issue->status == 4 || $issue->status == 6)) || ($issue->resolver_id == $user->id && ($issue->status == 2 || $issue->status == 7));
        } else {
            // return ($issue->user->id == $user->id && ($issue->status == 4 || $issue->status == 6)) || ($issue->status == 1 || $issue->status == 7);
            return ($issue->user->id == $user->id && ($issue->status == 4 || $issue->status == 6)) || ($issue->status == 1);
        }
    }

    public function xupdate_resolver(User $user)
    {
        return $user->isAdmin() || $user->isHOD();
    }

    public function viewLogs(User $user, Issue $issue)
    {
        if ($issue->resolver_id == null) {
            return $user->isAdmin() || $user->isHOD();
        }
        return $user->id === $issue->resolver->id || ($user->isAdmin() || $user->isHOD());
    }

    public function viewMessage(User $user, Issue $issue)
    {
        if ($issue->resolver_id == null) {
          return $user->isAdmin() || $user->isHOD() || $issue->user->id == $user->id;
        } else {
          return $user->isAdmin() || $user->isHOD() || $issue->user->id == $user->id || $user->id === $issue->resolver->id;
        }
    }

    public function reject(User $user, Issue $issue)
    {
        return ($user->isAdmin() || $user->isHOD()) && ($issue->reff_no == null || substr($issue->reff_no, 0, 4) == 'TEMP');
    }

    public function sendMessage(User $user, Issue $issue)
    {
        if ($issue->resolver_id == null) {
          return ($user->isAdmin() || $user->isHOD() || $issue->user->id == $user->id) && (in_array($issue->status, [1, 2, 3, 4, 7]));
        } else {
          return ($user->isAdmin() || $user->isHOD() || $issue->user->id == $user->id || $user->id === $issue->resolver->id) && (in_array($issue->status, [1, 2, 3, 4, 7]));
        }
    }

    public function readMessage(User $user, Issue $issue)
    {
        if ($issue->resolver_id == null) {
          return ($user->isAdmin() || $user->isHOD() || $issue->user->id == $user->id);
        } else {
          return ($user->isAdmin() || $user->isHOD() || $issue->user->id == $user->id || $user->id === $issue->resolver->id);
        }
    }
}
