# project name and programming language
project('com.github.nwallace.fanboy', 'vala', 'c')

gnome = import('gnome')

sources = [
  join_paths('src', 'main.vala'),

  join_paths('src', 'ui', 'application.vala'),
  join_paths('src', 'ui', 'main-menu.vala'),
  join_paths('src', 'ui', 'tournament-list-item.vala')
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
    dependency('gtk+-3.0')
  ],
  install: true
)

# Install the .desktop file so the Applications Menu will see it
install_data(
  join_paths('data', meson.project_name() + '.desktop'),
  install_dir: join_paths(get_option('datadir'), 'applications')
)
