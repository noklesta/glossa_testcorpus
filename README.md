Test corpus for Glossa (<http://github.com/noklesta/glossa_svn>) consisting of
the English version of the EU constitution, copied from <http://urd.let.rug.nl/tiedeman/OPUS/>.

Requirements
------------
* A Glossa installation, of course. See <http://github.com/noklesta/glossa_svn>.
* The finished corpus is included in this repository and does not need to be re-created, but it can nevertheless
be accomplished by running the `create_corpus.rb` ruby script.
In that case you will need the nokogiri ruby gem (`sudo gem install nokogiri`).

Instructions
------------
* Copy the `test` directory that is found in the `conf` directory to the location 
  where you want to keep your configuration files. This location should be specified 
  in the file `cgi-bin/glossa/paths.conf` in your Glossa installation. In other words, 
  if the `conf` parameter given in `paths.conf` is `/opt/glossa/conf/`, you should now 
  end up with `/opt/glossa/conf/test/cgi.conf`.
* Edit the `cgi.conf` file to specify the following:
  * `htmlRoot` (the root URL for HTML, PHP, and JavaScript files) and `cgiRoot` 
    (the root URL for CGI files)
  * the path to your registry directory
  * the location that will be used for exports of search results (`dat_files`). Since
    the exported files will be served from here, it needs to be located below the document
    root of your web server.
  * `config_dir`, which should be set to the same as the `conf` parameter in `paths.conf`
* Copy the `TEST` directory found in the `corpus_data` directory to the location where you 
  want to store corpus data.
* Copy the file `corpus_registry/test` to your CWB registry location and edit the `PATH` 
  line in this file to point to the `TEST` directory.
* Copy the contents of the `html` directory to the `html` directory below `htmlRoot` 
  in your Glossa installation.
* Copy the contents of the `js` directory to the `js` directory below `htmlRoot` in 
  your Glossa installation. Edit `test.conf.js` and set the `htmlRoot` and `cgiRoot` 
  variables to the same values as in the `cgi.conf` file.

References
----------
Please cite the following article if you use any part of the corpus in your own work:  
Jörg Tiedemann, Lars Nygaard, 2004, The OPUS corpus - parallel & free. In Proceedings of the 
Fourth International Conference on Language Resources and Evaluation (LREC'04). Lisbon, Portugal

