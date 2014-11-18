# Install CF component jobs
jenkins_mode = node['jenkins_cf']['mode']

if jenkins_mode.include?('deploy')
	comp_jobs_install = node['jenkins_cf']['comp_jobs']
	if comp_jobs_install.count > 0
	  comp_jobs_install.each do |component|
	    log "Creating Jenkins job for #{component}"
	    include_recipe "jenkins_cf::jobs_component_#{component}"
	  end
	end
end