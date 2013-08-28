csshx_config = "/etc/clusters"
clusters = open(csshx_config).readlines()
for cluster in clusters:
	toks = cluster.split()
	name = toks[0]
	print "#", name
	for i in xrange(1, len(toks)):
		print "Host ", toks[i]
		print "\tProxyCommand ssh o.ryabukhin@searcher26 nc %h 22"
		print "\tUser o.ryabukhin"
