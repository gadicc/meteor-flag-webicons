#!/bin/sh

cat > package.js << __END__
Package.describe({
	summary: "Flag-Webicons packaged for Meteor"
});

Package.on_use(function(api) {
	api.add_files([
__END__

for flag in lib/Flag-Webicons/flags/* ; do
	echo -n "'$flag', " >> package.js
done

cat >> package.js << __END__
'flag-webicons.css'], 'client');
});
__END__

sed 's/url(\"flags\//url(\"\/packages\/flag-webicons\/lib\/Flag-Webicons\/flags\//' \
	lib/Flag-Webicons/flag-webicons.css > flag-webicons.css
