"""Test /items endpoints."""
import json


def test_items(app):
    """Test /items endpoint."""
    response = app.get("/collections/public.landsat_wrs/items")
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert body["type"] == "FeatureCollection"
    assert body["id"] == "public.landsat_wrs"
    assert body["title"] == "public.landsat_wrs"
    assert body["links"]
    assert body["numberMatched"] == 16269
    assert body["numberReturned"] == 10
    assert ["collection", "self", "next"] == [link["rel"] for link in body["links"]]

    response = app.get("/collections/public.landsat_wrs/items?f=html")
    assert response.status_code == 200
    assert "text/html" in response.headers["content-type"]
    assert "Collection Items: public.landsat_wrs" in response.text


def test_items_limit_and_offset(app):
    """Test /items endpoint with limit and offset options."""
    response = app.get("/collections/public.landsat_wrs/items?limit=1")
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 1
    assert body["features"][0]["id"] == "1"
    assert body["features"][0]["properties"]["ogc_fid"] == 1
    assert body["numberMatched"] == 16269
    assert body["numberReturned"] == 1

    response = app.get("/collections/public.landsat_wrs/items?limit=1&offset=1")
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 1
    assert body["features"][0]["id"] == "2"
    assert body["features"][0]["properties"]["ogc_fid"] == 2
    assert body["numberMatched"] == 16269
    assert body["numberReturned"] == 1
    assert ["collection", "self", "next", "prev"] == [
        link["rel"] for link in body["links"]
    ]

    # negative offset
    response = app.get("/collections/public.landsat_wrs/items?offset=-1")
    assert response.status_code == 422

    # last item
    response = app.get("/collections/public.landsat_wrs/items?offset=16268")
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 1
    assert body["features"][0]["id"] == "16269"
    assert body["features"][0]["properties"]["ogc_fid"] == 16269
    assert body["numberMatched"] == 16269
    assert body["numberReturned"] == 1
    assert ["collection", "self", "prev"] == [link["rel"] for link in body["links"]]

    # TODO: Fix
    # offset > data
    # response = app.get("/collections/public.landsat_wrs/items?offset=20000")
    # assert response.status_code == 200
    # body = response.json()
    # assert len(body["features"]) == 0
    # assert body["numberMatched"] == 16269
    # assert body["numberReturned"] == 0


def test_items_bbox(app):
    """Test /items endpoint with bbox options."""
    response = app.get(
        "/collections/public.landsat_wrs/items?bbox=-94.702148,34.488448,-85.429688,41.112469"
    )
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 10
    assert body["numberMatched"] == 45
    assert body["numberReturned"] == 10

    response = app.get(
        "/collections/public.landsat_wrs/items?bbox=-200,34.488448,-85.429688,41.112469"
    )
    assert response.status_code == 422

    response = app.get(
        "/collections/public.landsat_wrs/items?bbox=-94.702148,91,-85.429688,41.112469"
    )
    assert response.status_code == 422

    response = app.get(
        "/collections/public.landsat_wrs/items?bbox=-200,34.488448,0,-85.429688,41.112469,0"
    )
    assert response.status_code == 422

    response = app.get(
        "/collections/public.landsat_wrs/items?bbox=-94.702148,91,0,-85.429688,41.112469,0"
    )
    assert response.status_code == 422

    # more than 6 coordinates
    response = app.get("/collections/public.landsat_wrs/items?bbox=0,1,2,3,4,5,6")
    assert response.status_code == 422


def test_items_ids(app):
    """Test /items endpoint with ids options."""
    response = app.get("/collections/public.landsat_wrs/items?ids=1")
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 1
    assert body["numberMatched"] == 1
    assert body["numberReturned"] == 1
    assert body["features"][0]["id"] == "1"
    assert body["features"][0]["properties"]["ogc_fid"] == 1

    response = app.get("/collections/public.landsat_wrs/items?ids=1,2")
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 2
    assert body["numberMatched"] == 2
    assert body["numberReturned"] == 2
    assert body["features"][0]["id"] == "1"
    assert body["features"][0]["properties"]["ogc_fid"] == 1
    assert body["features"][1]["id"] == "2"
    assert body["features"][1]["properties"]["ogc_fid"] == 2


def test_items_properties(app):
    """Test /items endpoint with properties options."""
    response = app.get("/collections/public.landsat_wrs/items?properties=path,row")
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert sorted(["path", "row", "ogc_fid"]) == sorted(
        list(body["features"][0]["properties"])
    )

    # no properties
    response = app.get("/collections/public.landsat_wrs/items?properties=")
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert ["ogc_fid"] == list(body["features"][0]["properties"])


def test_items_properties_filter(app):
    """Test /items endpoint with properties filter options."""
    response = app.get("/collections/public.landsat_wrs/items?path=13")
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 10
    assert body["numberMatched"] == 104
    assert body["numberReturned"] == 10
    assert body["features"][0]["properties"]["path"] == 13

    # invalid type (str instead of int)
    response = app.get("/collections/public.landsat_wrs/items?path=d")
    assert response.status_code == 500
    assert "invalid input syntax for type integer" in response.json()["detail"]

    response = app.get("/collections/public.landsat_wrs/items?path=13&row=10")
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 1
    assert body["numberMatched"] == 1
    assert body["numberReturned"] == 1
    assert body["features"][0]["properties"]["path"] == 13
    assert body["features"][0]["properties"]["row"] == 10

    response = app.get("/collections/public.landsat_wrs/items?path=1000000")
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 0
    assert body["numberMatched"] == 0
    assert body["numberReturned"] == 0

    # TODO: fix, Table.query shouldn't return items when filtering on invalid properties (gpath isn't a valid property name)
    response = app.get("/collections/public.landsat_wrs/items?gpath=10")
    assert response.status_code == 404


def test_items_filter_cql_ids(app):
    """Test /items endpoint with ids options."""
    filter = {"op": "=", "args": [{"property": "ogc_fid"}, 1]}
    response = app.get(
        f"/collections/public.landsat_wrs/items?filter-lang=cql2-json&filter={json.dumps(filter)}"
    )
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 1
    assert body["numberMatched"] == 1
    assert body["numberReturned"] == 1
    assert body["features"][0]["id"] == "1"
    assert body["features"][0]["properties"]["ogc_fid"] == 1

    response = app.get(
        "/collections/public.landsat_wrs/items?filter-lang=cql2-text&filter=ogc_fid=1"
    )
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 1
    assert body["numberMatched"] == 1
    assert body["numberReturned"] == 1
    assert body["features"][0]["id"] == "1"
    assert body["features"][0]["properties"]["ogc_fid"] == 1

    response = app.get(
        "/collections/public.landsat_wrs/items?filter-lang=cql2-text&filter=ogc_fid IN (1,2)"
    )
    print(response.content)
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 2
    assert body["numberMatched"] == 2
    assert body["numberReturned"] == 2
    assert body["features"][0]["id"] == "1"
    assert body["features"][0]["properties"]["ogc_fid"] == 1
    assert body["features"][1]["id"] == "2"
    assert body["features"][1]["properties"]["ogc_fid"] == 2


def test_items_properties_filter_cql2(app):
    """Test /items endpoint with properties filter options."""
    filter = {"op": "=", "args": [{"property": "path"}, 13]}
    response = app.get(
        f"/collections/public.landsat_wrs/items?filter-lang=cql2-json&filter={json.dumps(filter)}"
    )
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 10
    assert body["numberMatched"] == 104
    assert body["numberReturned"] == 10
    assert body["features"][0]["properties"]["path"] == 13

    # invalid type (str instead of int)
    filter = {"op": "=", "args": [{"property": "path"}, "d"]}
    response = app.get(
        f"/collections/public.landsat_wrs/items?filter-lang=cql2-json&filter={json.dumps(filter)}"
    )
    assert response.status_code == 500
    assert "integer is required" in response.json()["detail"]

    filter = {
        "op": "and",
        "args": [
            {"op": "=", "args": [{"property": "path"}, 13]},
            {"op": "=", "args": [{"property": "row"}, 10]},
        ],
    }
    response = app.get(
        f"/collections/public.landsat_wrs/items?filter-lang=cql2-json&filter={json.dumps(filter)}"
    )
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 1
    assert body["numberMatched"] == 1
    assert body["numberReturned"] == 1
    assert body["features"][0]["properties"]["path"] == 13
    assert body["features"][0]["properties"]["row"] == 10

    response = app.get(
        "/collections/public.landsat_wrs/items?filter-lang=cql2-text&filter=path=13 AND row=10"
    )
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert len(body["features"]) == 1
    assert body["numberMatched"] == 1
    assert body["numberReturned"] == 1
    assert body["features"][0]["properties"]["path"] == 13
    assert body["features"][0]["properties"]["row"] == 10


def test_items_geo_filter_cql2(app):
    response = app.get(
        "/collections/public.landsat_wrs/items?filter-lang=cql2-text&filter=S_INTERSECTS(geom, POLYGON((-22.2153 79.6888,-22.2153 81.8555,-8.97407 81.8555,-8.97407 79.6888,-22.2153 79.6888)))"
    )
    assert response.status_code == 200
    body = response.json()
    assert len(body["features"]) == 10
    assert body["numberMatched"] == 78


def test_items_geom_column(app):
    """Test /items endpoint geom_column."""
    response = app.get("/collections/public.landsat_wrs/items?geom-column=geom")
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert body["type"] == "FeatureCollection"
    assert body["id"] == "public.landsat_wrs"
    assert body["title"] == "public.landsat_wrs"
    assert body["links"]
    assert body["numberMatched"] == 16269
    assert body["numberReturned"] == 10

    # Invalid geom-column name
    response = app.get("/collections/public.landsat_wrs/items?geom-column=the_geom")
    assert response.status_code == 404
    assert response.headers["content-type"] == "application/json"
    body = response.json()
    assert body["detail"] == "Invalid Geometry Column: the_geom."


def test_items_datetime(app):
    """Test /items endpoint datetime."""
    response = app.get(
        "/collections/public.my_data/items?datetime=2004-10-19T10:23:54Z"
    )
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert body["type"] == "FeatureCollection"
    assert body["id"] == "public.my_data"
    assert body["title"] == "public.my_data"
    assert body["links"]
    assert body["numberMatched"] == 1
    assert body["numberReturned"] == 1

    # no datetime column
    response = app.get(
        "/collections/public.landsat_wrs/items?datetime=2004-10-19T10:23:54Z&datetime-column=the_datetime"
    )
    assert response.status_code == 500
    assert response.headers["content-type"] == "application/json"
    body = response.json()
    assert body["detail"] == "Must have timestamp typed column to filter with datetime."

    # Invalid datetime column
    response = app.get(
        "/collections/public.my_data/items?datetime=2004-10-19T10:23:54Z&datetime-column=the_datetime"
    )
    assert response.status_code == 404
    assert response.headers["content-type"] == "application/json"
    body = response.json()
    assert body["detail"] == "Invalid Datetime Column: the_datetime."

    # TODO Fix table.Query
    # no items for 2004-10-10T10:23:54
    # response = app.get("/collections/public.my_data/items?datetime=2004-10-10T10:23:54Z")
    # assert response.status_code == 200
    # assert response.headers["content-type"] == "application/geo+json"
    # body = response.json()
    # assert body["numberMatched"] == 0
    # assert body["numberReturned"] == 0

    # Closed Interval
    response = app.get(
        "/collections/public.my_data/items?datetime=2004-10-19T10:23:54Z/2004-10-21T10:23:54Z"
    )
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()

    assert body["numberMatched"] == 2
    assert body["numberReturned"] == 2

    # Open end-Interval (2004-10-20T10:23:54Z or later)
    response = app.get(
        "/collections/public.my_data/items?datetime=2004-10-20T10:23:54Z/.."
    )
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert body["numberMatched"] == 5
    assert body["numberReturned"] == 5

    response = app.get(
        "/collections/public.my_data/items?datetime=2004-10-20T10:23:54Z/"
    )
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert body["numberMatched"] == 5
    assert body["numberReturned"] == 5

    # Open start-Interval (2004-10-20T10:23:54 or earlier)
    response = app.get(
        "/collections/public.my_data/items?datetime=../2004-10-20T10:23:54Z"
    )
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert body["numberMatched"] == 2
    assert body["numberReturned"] == 2

    response = app.get(
        "/collections/public.my_data/items?datetime=/2004-10-20T10:23:54Z"
    )
    assert response.status_code == 200
    assert response.headers["content-type"] == "application/geo+json"
    body = response.json()
    assert body["numberMatched"] == 2
    assert body["numberReturned"] == 2

    # bad interval
    response = app.get("/collections/public.my_data/items?datetime=../..")
    assert response.status_code == 422
    assert response.headers["content-type"] == "application/json"

    # bad interval
    response = app.get(
        "/collections/public.my_data/items?datetime=2004-10-21T10:23:54Z/2004-10-20T10:23:54Z"
    )
    assert response.status_code == 422
    assert response.headers["content-type"] == "application/json"