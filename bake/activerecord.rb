# Apply any pending migrations to the database schema
def migrate
	call('activerecord:environment')
	Rake::Task['db:migrate'].invoke
end

# Undo the last database migration
def rollback
	call('activerecord:environment')
	Rake::Task['db:rollback'].invoke
end

# Create (if required) the database specified by the current configuration
def create
	call('activerecord:environment')
	Rake::Task['db:create'].invoke
end

# Deploy the database
#
# This consists of the following steps:
#   - Creating the database, if required,
#   - Running migrations
#   - Seeding any data
def deploy
	call('activerecord:environment')
	Rake::Task['db:deploy'].invoke
end

# Delete the database specified by the current configuration
def drop
	call('activerecord:environment')
	Rake::Task['db:drop'].invoke
end

def environment
	require 'active_record/migrations/tasks'
	
	# The root must be the root of your application, and contain `db/`.
	ActiveRecord::Migrations.root = context.root
end
