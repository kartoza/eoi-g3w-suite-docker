


if [ -z "$(ls -A /code)" ]; then
   echo "Cloning g3w-admin ..."
   git clone https://github.com/kartoza/g3w-admin.git --branch custom-request-schema --depth 1 /code && \
   cd /code
fi

cp /requirements_rl.txt .

# Override settings
pip3 install -r requirements_rl.txt
pip3 install -r requirements_huey.txt

# Front end
#TODO make this as generic so that we can install as many plugins as possible
git submodule add -f https://github.com/g3w-suite/g3w-admin-frontend.git  g3w-admin/frontend

# Dam monitor
git submodule add -f https://github.com/kartoza/eoi-g3w-dam-monitor.git  g3w-admin/dam_monitor
git submodule add -f https://github.com/kartoza/eoi-g3w-api.git  g3w-admin/g3w_api


# Caching
pip3 install -r /code/g3w-admin/caching/requirements.txt

# File manager
pip3 install -r /code/g3w-admin/filemanager/requirements.txt

# Qplotly
pip3 install -r /code/g3w-admin/qplotly/requirements.txt

# Openrouteservice
pip3 install -r /code/g3w-admin/openrouteservice/requirements.txt

echo "Installing QPS timeseries"
export DEB_PYTHON_INSTALL_LAYOUT=deb_system
pip3 install git+https://github.com/kartoza/g3w-admin-ps-timeseries.git@fix-qvariant