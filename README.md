## How to run

```sh
$ docker pull vincentliao/jupyter_notebook_env
$ mkdir workspace
$ docker run -it -p 8888:8888 -v $(pwd)/workspace:/workspace vincentliao/jupyter_notebook_env
```

## Jupyter password

Default password is `jupyter`. Changing the password with container by editing jupyter configuration file located at `\root\.jupyter\jupyter_notebook_config.py`. Replace following code with your new password.

```python
## password is 'jupyter'
c.NotebookApp.password = u'sha1:79fd98159db9:805189f1d3db983aafe0a0a69463c7f31f39e641'
```

You can generate new password with following code provided from Jupyter document.

```python
In [1]: from notebook.auth import passwd
In [2]: passwd()
Enter password: ········
Verify password: ········
Out[2]: 'sha1:f3d2a7d71054:299b6af58631ae7fdfce259202e9c594085675d2'
```

## Packages in the Docker Image

* [Python 3.7](https://www.python.org/downloads/release/python-370/)
* [Jupyter Notebook](https://jupyter.org/)
* [scipy](https://www.scipy.org/), [numpy](https://www.numpy.org/), [matplotlib](https://matplotlib.org/)
* [pandas](https://pandas.pydata.org/)
* [Bokeh](https://bokeh.pydata.org/en/latest/)
