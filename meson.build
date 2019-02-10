# project name and programming language
project('com.github.nwallace.fanboy', 'vala', 'c')

gnome = import('gnome')

sources = [
  join_paths('src', 'main.vala'),

  join_paths('src', 'remotes', 'response.vala'),
  join_paths('src', 'remotes', 'titles.vala'),
  join_paths('src', 'remotes', 'tournaments.vala'),

  join_paths('src', 'ui', 'application.vala'),
  join_paths('src', 'ui', 'application-window.vala'),
  join_paths('src', 'ui', 'web-image.vala'),
  join_paths('src', 'ui', 'title-list-item.vala'),
  join_paths('src', 'ui', 'tournament-list-item.vala'),

  join_paths('src', 'controller.vala'),

  join_paths('src', 'models', 'title.vala'),
  join_paths('src', 'models', 'tournament.vala'),

  join_paths('src', 'utils', 'images.vala')
] + gnome.compile_resources(
  'resources',
  join_paths('data', meson.project_name() + '.gresource.xml'),
  source_dir: 'data',
  c_name: 'resources'
)

# Create a new executable, list the files we want to compile, list the dependencies we need, and install
executable(
  meson.project_name(),
  sources,
  dependencies: [
    dependency('gtk+-3.0'),
    dependency('libhandy-0.0'),
    dependency('gee-0.8'),
    dependency('libsoup-2.4'),
    dependency('json-glib-1.0')
  ],
  c_args: ['-DHANDY_USE_UNSTABLE_API'],
  install: true
)

# Install the .desktop file so the Applications Menu will see it
install_data(
  join_paths('data', meson.project_name() + '.desktop'),
  install_dir: join_paths(get_option('datadir'), 'applications')
)
