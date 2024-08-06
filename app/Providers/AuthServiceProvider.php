<?php

namespace App\Providers;

use App\Tag;
use App\Item;
use App\Role;
use App\User;
use App\Category;
use App\Staff;
use App\Issue;
use App\Holiday;
use App\Archive;
use App\Policies\TagPolicy;
use App\Policies\ItemPolicy;
use App\Policies\RolePolicy;
use App\Policies\UserPolicy;
use App\Policies\CategoryPolicy;
use App\Policies\StaffPolicy;
use App\Policies\IssuePolicy;
use App\Policies\HolidayPolicy;
use App\Policies\ArchivePolicy;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        User::class => UserPolicy::class,
        Category::class => CategoryPolicy::class,
        Item::class => ItemPolicy::class,
        Role::class => RolePolicy::class,
        Tag::class => TagPolicy::class,
        Staff::class => StaffPolicy::class,
        Issue::class => IssuePolicy::class,
        Holiday::class => HolidayPolicy::class,
        Archive::class => ArchivePolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('manage-items', 'App\Policies\UserPolicy@manageItems');

        Gate::define('manage-categories', 'App\Policies\UserPolicy@manageCategories');

        Gate::define('manage-users', 'App\Policies\UserPolicy@manageUsers');

        Gate::define('manage-holidays', 'App\Policies\UserPolicy@manageHolidays');

        Gate::define('manage-staffs', 'App\Policies\UserPolicy@manageStaffs');

        Gate::define('manage-genreport', 'App\Policies\UserPolicy@generateReports');

        Gate::define('view-logs', 'App\Policies\UserPolicy@viewLogs');

        Gate::define('manage-maincategory', 'App\Policies\UserPolicy@managemaincategory');

        Gate::define('update-password', function($user){
            return in_array($user->role_id, [1, 2, 3]);
        });

        Gate::define('update-profile', function($user){
            return in_array($user->role_id, [1, 2, 3, 4]);
        });
        
        Gate::define('update-email', function($user){
            return $user->isAdmin();
            // return in_array($user->role_id, [1, 2, 3]);
        });
        
        Gate::define('update-role', function($user){
            return $user->isAdmin();
        });
        
        Gate::define('manage-staffs', function($user){
            return $user->isAdmin();
        });
        
        Gate::define('update-reported_by', function($user){
            return $user->isAdmin() || $user->isHOD();
        });
        
        Gate::define('update_resolver', function($user){
            return $user->isAdmin() || $user->isHOD();
        });
        
        Gate::define('create_issue', function($user){
            return $user->isAdmin() || $user->isHOD() || ($user->isMember() && $user->status == 1);
        });
    }
}
