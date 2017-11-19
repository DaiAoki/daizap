var RecordBox = createReactClass({
  getInitialState: function() {
    //this function is called when create component
    return {records: this.props.records};
  },
  componentDidMount: function() {
    //this function is called when first render
  },
  handleRecordSubmit: function(record) {
    record.id = new Date();
    var newRecords = this.state.records.concat(record);
    this.setState({ records: newRecords });
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
// The unit of record is day. => should change below
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
    event.preventDefault();
    //var image = ReactDOM.findDOMNode(this.refs.image).value.trim();
    var weight = ReactDOM.findDOMNode(this.refs.weight).value.trim();
    //var weight = this.refs.weight.value.trim();
    if(!weight) {
      return;
    }
    this.props.onRecordSubmit({ weight: weight });
    //ReactDOM.findDOMNode(this.refs.image).value = '';
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
