# Create a new database migration
#
# @param name [String] The name of the migration to create
def new(name)
	call('activerecord:environment')
	Rake::Task['db:migrations:new'].invoke(name)
end
