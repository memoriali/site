from flask import Flask
from flask import render_template
import captions
import dataloader

app = Flask(__name__)

PATH_TO_TEMPLATES = "./tpl/"
app = Flask(__name__, template_folder=PATH_TO_TEMPLATES)

loader = dataloader.DataLoader()


@app.route('/')
def home_page():
    totalNumbers = loader.loadTotals()
    regions = loader.loadRegions()
    return render_template('layout.html',
                           captions=captions,
                           totals=totalNumbers,
                           regions=regions,
                           featured=0,
                           showslides=0,
                           bodyhtml='main')

@app.route('/map')
def map_page():
    totalNumbers = loader.loadTotals()
    regions = loader.loadRegions()
    return render_template('layout.html',
                           captions=captions,
                           totals=totalNumbers,
                           regions=regions,
                           featured=0,
                           showslides=0,
                           bodyhtml='map')


@app.route('/contacts')
def contacts_page():
    regions = loader.loadRegions()    
    return render_template('layout.html',
                           captions=captions,
                           regions=regions,
                           featured=0,
                           showslides=0,
                           bodyhtml='contacts')

@app.route('/region/<regionid>')
def region_page(regionid):
    # abort(500); error 500 emulator...
    regions = loader.loadRegions()
    thisDistricts = loader.loadDistricts(regionid)
    thisRegion = False
    for r in regions:
        if r['region_id'] == int(regionid):
            thisRegion = r
            break
    return render_template('layout.html',
                           captions=captions,
                           regions=regions,
                           region=thisRegion,
                           districts=thisDistricts,
                           regionid=regionid,
                           featured=0,
                           showslides=0,
                           bodyhtml='region')


@app.route('/district/<districtid>')
def district_page(districtid):
    regions = loader.loadRegions()
    memorialsByDistrict = loader.loadMemorials(districtid)
    return render_template('layout.html',
                           captions=captions,
                           memorials=memorialsByDistrict,
                           regions=regions,
                           featured=0,
                           showslides=0,
                           bodyhtml='district')


@app.route('/memorial/<memorialid>/<currentPageNo>')
def memorial_page(memorialid, currentPageNo):
    #pageno=1
    pagesize=20
    memorial = loader.loadMemorialById(memorialid, currentPageNo, pagesize)
    regions = loader.loadRegions()
    return render_template('layout.html',
                           captions=captions,
                           regions=regions,
                           memorial=memorial,
                           currentPageNo=currentPageNo,
                           featured=0,
                           showslides=0,
                           pagesize=pagesize,
                           bodyhtml='memorial')



# <Error pages>
@app.errorhandler(404)
def page_not_found(e):
    return render_template('errors/404.html', captions=captions), 404

@app.errorhandler(500)
def internal_server_error(e):
    return render_template('errors/500.html', captions=captions), 500
# </Error pages>


# Uncomment this line, if running in Development environment
# i.e. not with Gunicorn
app.run(host='0.0.0.0', port='80', threaded=True)

