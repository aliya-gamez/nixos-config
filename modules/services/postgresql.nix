{ config, pkgs, ... }:

{
	services.postgresql = {
		enable = true;
		package = pkgs.postgresql_17;
		#ensureDatabases = [ "aliya_db " ];
		authentication = pkgs.lib.mkOverride 10 ''
			#type database  DBuser  auth-method
			local all       all     trust
		'';

    /*
    ensureUsers = [
      {
        name = "aliya";
        ensureDBOwnership = true;
      }
    ];
    */
	};
}

/*

sudo -u postgres createuser --superuser aliya

verify
psql

createdb django_blog
createdb django_store
createdb django_api

backup: pg_dump django_blog > database.sql

restore:
createdb django_blog
psql django_blog < database.sql

*/