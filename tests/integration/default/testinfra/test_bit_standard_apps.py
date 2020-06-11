def test_file_exists(host):
    bit_standard_apps = host.file('/bit_standard_apps.yml')
    assert bit_standard_apps.exists
    assert bit_standard_apps.contains('your')

# def test_bit_standard_apps_is_installed(host):
#     bit_standard_apps = host.package('bit_standard_apps')
#     assert bit_standard_apps.is_installed
#
#
# def test_user_and_group_exist(host):
#     user = host.user('bit_standard_apps')
#     assert user.group == 'bit_standard_apps'
#     assert user.home == '/var/lib/bit_standard_apps'
#
#
# def test_service_is_running_and_enabled(host):
#     bit_standard_apps = host.service('bit_standard_apps')
#     assert bit_standard_apps.is_enabled
#     assert bit_standard_apps.is_running
