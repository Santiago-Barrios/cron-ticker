
let times = 0;

const syncDB = () => {
    times++;
    console.log('ticket every 5 seconds', times);
    return times
}

module.exports = {
    syncDB
}