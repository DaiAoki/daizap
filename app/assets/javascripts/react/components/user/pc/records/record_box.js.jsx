var RecordBox = createReactClass({
  getInitialState: function() {
    //this function is called when create component
    return {records: this.props.records};
  },
  componentDidMount: function() {
    //this function is called when first render
  },
  render: function() {
    var recordItems = this.state.records.map(function(rec) {
      //MEMO: Enable show content of object
      //alert(JSON.stringify(rec));
      return (
        <RecordItem id={rec.user_id} weight={rec.weight} image={rec.image}/>
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
          <RecordForm />
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
        <h2 className="record-item__user-id">{this.props.id}</h2>
        <image className="record-item__image" src="{this.props.image}"/>
        <div className="record-item__weight">{this.props.weight}</div>
      </div>
    );
  }
});
var RecordForm = createReactClass({
  handleSubmit: function(event) {
    event.preventDefault();
    var weight = ReactDOM.findDOMNode(this.refs.weight).value.trim();
    //var weight = this.refs.weight.value.trim();
    if(!weight) {
      return;
    }
    //親イベント
    //TODO
    //this.props.onRecordSubmit({ weight: weight });
    ReactDOM.findDOMNode(this.refs.weight).value = '';
  },
  render: function() {
    return (
      <div className="record-form">
        <form className="record-form__form" onSubmit={this.handleSubmit}>
          <input type="text" placeholder="weight" ref="weight" />
          <input type="submit" value="Post" />
        </form>
      </div>
    );
  }
});
