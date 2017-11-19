var RecordBox = createReactClass({
  getInitialState: function() {
    //this function is called when create component
    return { records: [], isLoading: true };
  },
  loadRecordsFromServer: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(records) {
        this.setState({ records: records, isLoading: false });
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  componentDidMount: function() {
    //this function is called when first render
    this.loadRecordsFromServer();
    setInterval(this.loadRecordsFromServer, this.props.pollInterval);
  },
  handleRecordSubmit: function(record) {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: record,
      success: function(record) {
        var newRecords = this.state.records.concat(record);
        this.setState({ records: newRecords });
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render: function() {
    var recordItems = this.state.records.map(function(rec) {
      //MEMO: Enable show content of object
      //alert(JSON.stringify(rec));
      return (
        <RecordItem key={rec.id} user_id={rec.user_id} weight={rec.weight} image={rec.image}/>
      );
    });
    if(this.state.isLoading) {
      //MEMO: if I dislike this display, I should implement by server-side rendering.
      return (
        <div>Loading Now...</div>
      );
    } else {
      return (
        <div className="record-box">
          {recordItems}
          <RecordForm onRecordSubmit={this.handleRecordSubmit} />
        </div>
      );
    }
  }
});
var RecordItem = createReactClass({
  render: function() {
    return (
      <div className="record-item">
        <h2 className="record-item__user-id">{this.props.user_id}</h2>
        <image className="record-item__image" src="{this.props.image}"/>
        <div className="record-item__weight">{this.props.weight}</div>
      </div>
    );
  }
});
var RecordForm = createReactClass({
  handleSubmit: function(event) {
    //TODO: image submit
    event.preventDefault();
    var image = ReactDOM.findDOMNode(this.refs.image).value.trim();
    var weight = ReactDOM.findDOMNode(this.refs.weight).value.trim();
    // I can write below.
    //var weight = this.refs.weight.value.trim();
    if(!weight && !image) {
      // Both of parameter is lack => reject
      return;
    }
    this.props.onRecordSubmit({ image: image, weight: weight });
    ReactDOM.findDOMNode(this.refs.image).value = '';
    ReactDOM.findDOMNode(this.refs.weight).value = '';
  },
  render: function() {
    return (
      <div className="record-form">
        <form className="record-form__form" encType="multipart/form-data" onSubmit={this.handleSubmit}>
          <input type="file" ref="image" />
          <input type="text" placeholder="weight" ref="weight" />
          <input type="submit" value="Post" />
        </form>
      </div>
    );
  }
});
